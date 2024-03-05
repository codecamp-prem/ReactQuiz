import { Text, View, useWindowDimensions } from "react-native";
import RenderHtml from "react-native-render-html";
import { QAProps, getRandomItem } from "../types";

const QaUI = ({ allQA }: { allQA: QAProps[] }) => {
  const { width } = useWindowDimensions();
  const colorArray = [
    "bg-red-400",
    "bg-yellow-400",
    "bg-green-400",
    "bg-blue-400",
  ];
  return (
    <View>
      {allQA.map((qa) => {
        const source = { html: `${qa.answer}` };
        return (
          <View key={qa.id} className="py-4">
            <Text
              className={`mt-1 text-lg font-medium text-dark ${getRandomItem(
                colorArray
              )}`}
            >
              {`Q) ${qa.question}`}
            </Text>
            {/* <Text className="py-3 text-base leading-relaxed text-body-color dark:text-dark-6">
              {qa.answer}
            </Text> */}
            <RenderHtml contentWidth={width} source={source} />
          </View>
        );
      })}
    </View>
  );
};

export default QaUI;
