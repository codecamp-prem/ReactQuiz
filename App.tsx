import { StatusBar } from "expo-status-bar";
import { Text, View } from "react-native";
import "./styles.css";

export default function App() {
  return (
    <View className="flex-1 items-center justify-center bg-yellow font-bold uppercase">
      <Text>hello for the fuck sake!</Text>
      <StatusBar style="auto" />
    </View>
  );
}
