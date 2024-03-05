import { Asset } from "expo-asset";
import * as FileSystem from "expo-file-system";
//import { StatusBar } from "expo-status-bar";
import { NavigationContainer } from "@react-navigation/native";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import { SQLiteProvider } from "expo-sqlite/next";
import parse from "html-react-parser";
import { Suspense, useEffect, useState } from "react";
import { ActivityIndicator, Text, View } from "react-native";
import Home from "./screens/Home";
import "./styles.css";

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
    await FileSystem.downloadAsync(dbURI, dbFilePath);
  }
};

// async/await not needed when there is nothing to do after  async/await task.
//const FindQa = ({ topicId }: { topicId: string }) => {

export default function App() {
  const [dbLoaded, setDbLoaded] = useState(false);
  //const [allQA, setItems] = useState(null);

  useEffect(() => {
    loadDatabase()
      .then(() => setDbLoaded(true))
      .catch((e) => console.log(e));
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
              options={{ headerTitle: "Quiz", headerLargeTitle: true }}
            />
          </Stack.Navigator>
        </SQLiteProvider>
      </Suspense>
    </NavigationContainer>
  );
}

interface Props {
  qa: {
    id: string;
    topicId: string;
    question: string;
    answer: string;
  };
}
const QaUI = ({ qa }: Props) => {
  const [active, setActive] = useState(false);

  const handleToggle = () => {
    setActive(!active);
  };
  return (
    <div className="mb-4 w-full rounded-lg bg-gray-100 p-4 shadow-[0px_20px_95px_0px_rgba(201,203,204,0.30)] dark:bg-dark-2 dark:shadow-[0px_20px_95px_0px_rgba(0,0,0,0.30)] sm:p-8 lg:px-6 xl:px-8">
      <button
        className={`faq-btn flex w-full text-left`}
        onClick={() => handleToggle()}
      >
        <div className="mr-5 flex h-10 w-full max-w-[40px] items-center justify-center rounded-lg bg-primary/5 text-primary dark:bg-white/5">
          <svg
            className={`fill-primary stroke-primary duration-200 ease-in-out ${
              active ? "rotate-180" : ""
            }`}
            width="17"
            height="10"
            viewBox="0 0 17 10"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M7.28687 8.43257L7.28679 8.43265L7.29496 8.43985C7.62576 8.73124 8.02464 8.86001 8.41472 8.86001C8.83092 8.86001 9.22376 8.69083 9.53447 8.41713L9.53454 8.41721L9.54184 8.41052L15.7631 2.70784L15.7691 2.70231L15.7749 2.69659C16.0981 2.38028 16.1985 1.80579 15.7981 1.41393C15.4803 1.1028 14.9167 1.00854 14.5249 1.38489L8.41472 7.00806L2.29995 1.38063L2.29151 1.37286L2.28271 1.36548C1.93092 1.07036 1.38469 1.06804 1.03129 1.41393L1.01755 1.42738L1.00488 1.44184C0.69687 1.79355 0.695778 2.34549 1.0545 2.69659L1.05999 2.70196L1.06565 2.70717L7.28687 8.43257Z"
              fill=""
              stroke=""
            />
          </svg>
        </div>

        <div className="w-full">
          <h4 className="mt-1 text-lg font-medium text-dark">{qa.question}</h4>
        </div>
      </button>

      <div
        className={`pl-[62px] duration-200 ease-in-out ${
          active ? "block" : "hidden"
        }`}
      >
        <p className="py-3 text-base leading-relaxed text-body-color dark:text-dark-6">
          {parse(qa.answer)}
        </p>
      </div>
    </div>
  );
};
