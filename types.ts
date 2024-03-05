export interface QAProps {
  qa: {
    id: string;
    topicId: string;
    question: string;
    answer: string;
  };
}

export function getRandomItem(arr: any) {
  // get random index value
  const randomIndex = Math.floor(Math.random() * arr.length);

  // get random item
  const item = arr[randomIndex];

  return item;
}
