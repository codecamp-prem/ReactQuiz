import { Asset } from "expo-asset";
import * as FileSystem from "expo-file-system";
//import { StatusBar } from "expo-status-bar";
import { NavigationContainer } from "@react-navigation/native";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import { SQLiteProvider } from "expo-sqlite/next";
import { Suspense, useEffect, useState } from "react";
import { ActivityIndicator, Text, View } from "react-native";
import Home from "./screens/Home";

const Stack = createNativeStackNavigator();

const loadDatabase = async () => {
  const dbName = "learn-app.db";
  const dbAsset = require("./assets/learn-app.db");
  const dbURI = Asset.fromModule(dbAsset).uri;
  const dbFilePath = `${FileSystem.documentDirectory}SQLite/${dbName}`;

  const fileInfo = await FileSystem.getInfoAsync(dbFilePath);
  if (!fileInfo.exists) {
    await FileSystem.makeDirectoryAsync(
      `${FileSystem.documentDirectory}SQLite`,
      { intermediates: true }
    );
  }
  await FileSystem.downloadAsync(dbURI, dbFilePath);
};

export default function App() {
  const [dbLoaded, setDbLoaded] = useState(false);

  useEffect(() => {
    loadDatabase()
      .then(() => setDbLoaded(true))
      .catch((e) => console.log("loadDB error: ", e));
  }, []);

  if (!dbLoaded) {
    <View className="flex-1">
      <ActivityIndicator size={"large"} />
      <Text>Loading... DataBase</Text>
    </View>;
  }

  return (
    <NavigationContainer>
      <Suspense
        fallback={
          <View className="flex-1">
            <ActivityIndicator size={"large"} />
            <Text>Loading... DataBase</Text>
          </View>
        }
      >
        <SQLiteProvider databaseName="learn-app.db" useSuspense>
          <Stack.Navigator>
            <Stack.Screen
              name="Home"
              component={Home}
              options={{
                headerTitle: "React Interview Question Answer",
                headerLargeTitle: true,
              }}
            />
          </Stack.Navigator>
        </SQLiteProvider>
      </Suspense>
    </NavigationContainer>
  );
}
