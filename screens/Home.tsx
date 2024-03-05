import { useSQLiteContext } from "expo-sqlite/next";
import { useEffect, useState } from "react";
import { Text, View } from "react-native";
import { QAProps } from "../types";

const Home = () => {
  const [allQA, setAllQA] = useState<QAProps[]>([]);
  const reactTopicId = "clq97ec8y0000c6hhcmiakcut";

  const db = useSQLiteContext();

  useEffect(() => {
    db.withTransactionAsync(async () => {
      await getData();
    });
  }, [db]);

  async function getData() {
    const result = await db.getAllAsync<QAProps>(
      `select * from QuestionAnswer where topicId=?;`,
      ["clq97ec8y0000c6hhcmiakcut"]
    );
    setAllQA(result);
  }

  return (
    <View>
      <Text>Home Screen</Text>
    </View>
  );
};

export default Home;
