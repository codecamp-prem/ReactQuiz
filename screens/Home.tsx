import { useSQLiteContext } from "expo-sqlite/next";
import { useEffect, useState } from "react";
import { ScrollView } from "react-native";
import QaUI from "../components/QaUI";
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
    <ScrollView contentContainerStyle={{ padding: 15, paddingVertical: 170 }}>
      <QaUI allQA={allQA} />
    </ScrollView>
  );
};

export default Home;
