--
-- File generated with SQLiteStudio v3.2.1 on Sun Mar 3 19:03:32 2024
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: _prisma_migrations
CREATE TABLE "_prisma_migrations" (
    "id"                    TEXT PRIMARY KEY NOT NULL,
    "checksum"              TEXT NOT NULL,
    "finished_at"           DATETIME,
    "migration_name"        TEXT NOT NULL,
    "logs"                  TEXT,
    "rolled_back_at"        DATETIME,
    "started_at"            DATETIME NOT NULL DEFAULT current_timestamp,
    "applied_steps_count"   INTEGER UNSIGNED NOT NULL DEFAULT 0
);
INSERT INTO _prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) VALUES ('2d0f7a60-6353-4007-ba54-14570a696e7b', '1ede32ee314feea084cad9853781dfc52ef1bbfd611b957486eb1e6f0e95d798', 1702799266706, '20231217074746_initial_migration', NULL, NULL, 1702799266686, 1);

-- Table: QuestionAnswer
CREATE TABLE "QuestionAnswer" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "topicId" TEXT NOT NULL,
    "question" TEXT NOT NULL,
    "answer" TEXT NOT NULL,
    CONSTRAINT "QuestionAnswer_topicId_fkey" FOREIGN KEY ("topicId") REFERENCES "Topic" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clq9qvf590003c6hh47okt4be', 'clq97ec8y0000c6hhcmiakcut', 'What does it mean to derive state in React', 'Deriving state refers to the practice of computing values based on props or other state within a React component. It allows you to minimize the amount of React state you use in a component, often leading to more predictable state updates.<br/><code>const [searchTerm, setSearchTerm]=useState('''');<br/>const filteredItems=items.filter((item)=>item.toLowerCase().includes(searchTerm.toLowerCase()))</code>');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqkzx7vz0001oyolcv9ghlnw', 'clq97ec8y0000c6hhcmiakcut', 'what causes a React component to re-render?', 'When the state of a component changes.');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clql079150003oyolmfa8tiow', 'clq97ec8y0000c6hhcmiakcut', 'If you needed to preserve a value across renders, but that value had nothing to do with the UI, what would you do?', 'You''d store the value inside of a "ref" using <code>React.useRef</code>');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clql13vzd0005oyol7jf1mn21', 'clq97ec8y0000c6hhcmiakcut', 'What is the purpose of useEffect?', 'From a philosopical perspective, to synchronize your component with some external system. From a pragmatic perspective, to remove side effects (that aren''t triggered by a particular event) from React''s rendering flow.');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clql1rzv60007oyolxlwl59ag', 'clq97ec8y0000c6hhcmiakcut', 'What would you do if you had two components that both needed to share the same ''non-visual'' logic?', 'You''d encapsulate that logic into a custom hook that each component could consume.
<code>export default function useNonVisualLogic(){
//Reusable, non visual logic
}</code>');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clql1vzko0009oyolmz8hcvx3', 'clq97ec8y0000c6hhcmiakcut', 'How can you set default props for a component?', 'React components are just functions, so you can use JavaScript''s "default parameters" feature. <code>function Button({color="var(--yellow)" size="medium"}){...}</code>');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clql20ujy000boyolr8h1nawo', 'clq97ec8y0000c6hhcmiakcut', 'What''s the de facto way to add a new item to an array that''s on state?', 'To add an item to an array, use Javascript''s spread operator (...) to spread all the existing elements onto a new array with the new item.
<code>
	<br/>const handleNewHighScore = (session) => {
<br/>&emsp;const newHighScores = [...highScores, session]
	<br/>&emsp;setHighScores(newHighScores)
	<br/>}
</code>');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clql5lkkd0001zz80ydcts4b3', 'clq97ec8y0000c6hhcmiakcut', 'What''s the de facto way to remove an item from an array that''s on state?', 'To remove an item from an array, use Javascript''s filter method to create a new array, filtering out the item that should be removed.<br/>
<code>const handleRemoveCheater = (id) => {<br/>
	const newHighScores = highScores.filter((session) => <br/>
	&emsp;session.id !== id<br/>
	)<br/>
	setHighScores(newHighScores)<br/>
	}');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clql6kk1w0001wsofycot1o4l', 'clq97ec8y0000c6hhcmiakcut', 'What''s the de facto way to update an item in an array that''s on state?', 'To update an item, use JavaScript''s map method to create a new array, updating the specific item where appropriate.  <br/><code>const handleUpdateHighScore = (updatedSession) => {  <br/>
&emsp;const newHighScores = highScores.map((session) => {  
<br/>&emsp;&emsp;return session.id===updatedSession.id ? updatedSession : session <br/>&emsp;})
<br/>&emsp;setHighScores(newHighScores)<br/>
}</code>');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm0czgo0001qn6hndgo96id', 'clq97ec8y0000c6hhcmiakcut', 'What types of data can you pass as props?', 'It''s just Javascript, baby. Do whatever you want.<code><br/>
< Component onClick={handleClick} uid={69} authed={false} /><br/>
< Modal><br/>
	&emsp;< AnotherComponent type={IconTypes.SUCCESS} /><br/>
	&emsp;{children}<br/>
< / Modal><br/>
< Hover render={{(hovering) => {<br/>
	&emsp;return hovering === true<br/>
	&emsp;&emsp;?<i>"children" can be functions too</i><br/>
	&emsp;&emsp;:<i>It''s "just javascript", after all.</i><br/>
	}}} /></code>');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm0uniu0003qn6h81w3yuym', 'clq97ec8y0000c6hhcmiakcut', 'What are the most common techniques used to conditionally render UI in React?', 'The most basic example is just using a simple if/else statement.<code><br/>
function Dashboard(){<br/>
&emsp;const user = useAuth()
&emsp;if(user?.login === true){}<br/>
	or ternary operator<br/>
&emsp; return user ? < Login / > : < SignIn /><br/>
}</code>');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm0z0jz0005qn6h3sm7n8l6', 'clq97ec8y0000c6hhcmiakcut', 'What is a pure function and how are they relevant to React?', 'A function is considered pure if it contains no side effects and if, given the same input, it always returns the same output. They''re relevant to React because, as a rule, React components (and more specifically, React''s rendering flow) must be pure.');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm12dh90007qn6h7juw4yg3', 'clq97ec8y0000c6hhcmiakcut', 'What is the difference between a React element and a React component?', 'A React Element is an object description of a DOM node. A React component is a function that optionally accepts input (via props or context), and returns a React Element.');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm1brvc0009qn6hae6pvjfq', 'clq97ec8y0000c6hhcmiakcut', 'What are keys in React and why are they important?', 'Keys in React are used to identify unique elements in collections, such as arrays or maps. They play a critical role in helping React keep track of changes in the list or collection, ensuring that the rendering process in efficient and that the state is maintained correctly across re-renders.<code><br/>friends.map((friend) => {<br/>&emsp;return (<br/>&emsp;&emsp;< li key={friend.id}><br/>&emsp;&emsp;&emsp;< User profile={friend} /><br/>&emsp;&emsp;< /li>&emsp;)<br/>})</code>');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm1obzw000bqn6h4lzyn93u', 'clq97ec8y0000c6hhcmiakcut', 'What are children in React?', 'When you create an element, anything that is between the opening and closing tag of that element is considered children and is accessible in that components via props.children.<br/>
<code>< Layout>Anythin between this : text, components, {} are children < /Layout></code><br/>You can think of a component with a children prop as having a placeholder that can be filled by its parent component. Because of this, it''s common to utilize children to create Layout type components that encapsulate styling and logic, but leave the content to the consumer of the component.<br/>
	<code>< Modal onClose={handleClose}><br/>&emsp;< h1>Modal is Customizable< /h1><br/>&emsp;< p>''children'' can be whatever we want (and it can be different each time we use Modal< /p><br/>< /Modal>');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm1r2fi000dqn6h1s1reqpn', 'clq97ec8y0000c6hhcmiakcut', 'How would you handle the scenario where two components depend on the same piece of state?', 'Whenever you have state that multiple components depend on, you''ll want to lift that state up to the nearest parent component and then pass it down via props.');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm1uij9000fqn6hebhi00n2', 'clq97ec8y0000c6hhcmiakcut', 'How would you handle updating state that two components depend on?', 'Often times when lifting state up, you decouple where the state lives from the event handlers that update that state. To solve this, you''ll create an updater function in the parent component where the state lives and, via props, invoke that function from the child component(s) where the event handler(s) live.');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm2154a000hqn6hkt66j2h8', 'clq97ec8y0000c6hhcmiakcut', 'What are some signals that tell you should reach for useReducer instead of useState?', 'useReducer offers a bit more flexibility than useState since it allows you to decouple how the state is updated from the action that triggered the update - typically leading to more declarative state updates.<br/> If your state tends to be updated together or if updating one piece of state is based on another piece of state, that''s a signal you might want to use useReducer.');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm23q22000jqn6hd4b8y6d2', 'clq97ec8y0000c6hhcmiakcut', 'What are the two most common scenarios for using useRef in React?', '1. To preserve a value across renders, without triggering a re-render when it changes.<br/>2.To get a reference to a DOM node.');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm2cvkh000lqn6hgptccdk9', 'clq97ec8y0000c6hhcmiakcut', 'What are the common pitfalls with React.useEffect and how can you avoid them?', '1. You should avoid using React.useEffect for data transformations. Instead, derive state at the top of the component.<br/>
2. if a side effect is triggered by a specific user event, put that side effect in an event handler instead of React.useEffect.<br/>
3. Don''t use React.useEffect as a way to react to props or state changes.<br/>
4. Don''t use React.useEffect to subscribe to an external store, instead use React.useSyncExternalStore.<br/>
5. Don''t ignore React.useEffect''s dependency array or leave values out of it.<br/>
6. Don''t think of React.useEffect''s dependency array as a way to re-run effect. Instead, it''s a list of all of the dependencies needed to synchronize with some outside system.');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm2flmz000nqn6hro185phe', 'clq97ec8y0000c6hhcmiakcut', 'How would you add support for i18n(localized text) to your React application?', 'Because i18n requires that you''re able to pass locale data to any component in the component tree, regardless of how deeply nested the components are, React context is a good solution for it.');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm2j70w000pqn6hqappygdn', 'clq97ec8y0000c6hhcmiakcut', 'What is React.memo and when would you want to use it?', 'React.memo is a higher-order component (a function that takes in a React component as an argument and returns a new component). You''d want use it when you have an expensive component and you want the component to opt of React''s default behavior and only re-render when its props change.');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm2m3k0000rqn6hi5en7mr8', 'clq97ec8y0000c6hhcmiakcut', 'Describe a scenario where you''d want to use useLayoutEffect instead of useEffect.', 'React guarantees that the code inside of React.useLayoutEffect, as well as any state updates scheduled within it, will be processed before the browser repaints the screen.<br/>A scenario where you''d want to use it over React.useEffect is anytime your component is reliant upon layout information for rendereing. useMouse, useWindowScroll,  and useWindowSize are all examples of this.');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm3334d000tqn6hgnaa9fut', 'clq97ec8y0000c6hhcmiakcut', 'How would you fetch data from an external API in a React application?', 'Fetching data from an external API is a ''side effect'', so you''ll need to get it out of React''s rendering flow.<br/>
You have ''2'' options for this.<br/>
1.If the side effect is triggered by a specific user event, you can stick it inside of an event handler.<br/>
<code>const handleClick = async(id) => {<br/>const res = await fetch(`/api/item/${id}`);<br/>}</code>
<br/>2.If it''s not, then you''re most likely synchronizing your component with some outside system and therefore, you''ll want to stick it inside of ''React.useEffect''.<br/>
<code>React.useEffect(() => {<br/>&emsp;const fetchItem = async() => {<br/>&emsp;&emsp;const res = await fetch(`/api/item/${itemId}`);<br/>&emsp;}<br/>},[itemId]);</code>');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm3bocl000vqn6hvznk3hi0', 'clq97ec8y0000c6hhcmiakcut', 'Why is it necessary to include every dependency in React.useEffect''s dependency array?', 'There are two primary reasons.<br/>
1. If you don''t, React (and more specifically ESLint) will yell at you.<br/>
2. Because of how React''s snapshot phase "captures" the component''s props and state at specific moments in time, there are scenarios where, if you don''t include the appropriate values in the dependency array, those missing values will be "stale" inside of React.useEffect.');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm3pqij000xqn6hb3vtzdn2', 'clq97ec8y0000c6hhcmiakcut', 'How would you approach building a React app that needed to read the browser''s window size and react to its changes?', 'I''d encapsulate all of the logic for computing the browser''s window size into its own custom useWindowSize hook (and I''d be sure to use React.useLayoutEffect instead of useEffect since the hook is reliant upon layout information).<br/><code>
export default function useWindowSize() {<br/>
&emsp; const [size, setSize] = useState({width:null, height:null})<br/>
&emsp; React.useLayoutEffect(() => {<br/>
&emsp;&emsp; const handler = () => {<br/>
&emsp;&emsp;&emsp; setSize({<br/>
&emsp;&emsp;&emsp;&emsp;width: window.innerWidth,<br/>
&emsp;&emsp;&emsp;&emsp;height: window.innerHeight,<br/>
&emsp;&emsp;&emsp;})<br/>
&emsp;&emsp;}<br/>
&emsp;&emsp;handler();<br/>
&emsp;&emsp;window.addEventListener("resize", handle);<br/>
&emsp;&emsp;return () => {<br/>
&emsp;&emsp;&emsp;window.removeEventListener("resize",handle);<br/>
&emsp;&emsp;}<br/>
&emsp;}, [ ]);<br/>
&emsp;return size;<br/>
}</code>');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm47atb000zqn6hcq8qd9ym', 'clq97ec8y0000c6hhcmiakcut', 'How would you update a nested object that is stored as React State?', 'When you pass a value to React.useState''s updater function, whatever value you pass will always replace the current piece of state. What this means is that if you have a piece of state that is an object, it won''t be merged with the current state.<br/>
<code>const [appState, setAppState] = useState({ id: 1, name:''Fuk li''});<br/>
	setAppState({name: ''Suk li''}; //This will overwrite appState.<br/></code><br/>
	Instead of replacing the object, you most likely want to merge the new value with the existing state object. To do that, we can use Javascript''s spread operator to spread all of the existing key/value pairs onto a new object, then pass that new object to the updater function.<br/>
	<code>
	const updatedAppState = {<br/>
	&emsp; ...appState,<br/>
	&emsp; name: ''Suk li"<br/>
	}<br/>
	setAppState(updatedAppState);
	</code>');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm4aqat0011qn6hklzrxckm', 'clq97ec8y0000c6hhcmiakcut', 'Why are regular variables insufficient for reacting to user interactions in a React component?', 'For a few different reasons.<br/>
1. React has no way of knowing when regular variables change and is therefore unable to trigger a re-render when they do.<br/>
2. Normal variables don''t get persisted across renders.');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm4ezvz0013qn6hsbj416h6', 'clq97ec8y0000c6hhcmiakcut', 'What is the purpose of React''s StrictMode component?', 'StrictMode is a React component that enables the following behavior in development.<br/>
1. Your components will re-render an extra time to find bugs caused by impure rendering. <br/>
2. Your components will re-run Effects an extra time to find bugs caused by improper cleanups. <br/>
3. Your components will be checked for deprecated APIs.');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm4i78b0015qn6hbms3tai1', 'clq97ec8y0000c6hhcmiakcut', 'In the context of React, what is a "snapshot"?', 'A "snapshot" is a step in React''s rendering flow that captures everything React needs to update the view at a specific moment in time.<br/>props, state, event handlers, and a description of the UI(based on those props and state) are all captured in the snapshot.');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm4nt730017qn6hknxw1qcf', 'clq97ec8y0000c6hhcmiakcut', 'Describe the process that happens when React renders.', 'When React renders a component, two things happen.<br/>
1. First, React creates a snapshot of your component which captures everything React needs to update the view at that particular moment in time. props, state, event handlers, and a description of the UI(based on those props and state) are all captured in this snapshot.<br/>
2. From there, React takes that description of the UI and uses it to update the View.');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm4xmbs0019qn6hveutnojn', 'clq97ec8y0000c6hhcmiakcut', 'Tell me everything you know about React''s useMemo hook.', 'React.useMemo lets you cache the result of a calculation between renders.<br/>
<code>
	const cachedValue = React.useMemo(<br/>
	&emsp; calculateValue,<br/>
	&emsp; dependencies<br/>
	)<br/>
	</code><br/>
	It''s first argument is a function that returns the value you want to cache. It''s 2nd argument is an array of dependencies the function depends on. If any of the dependencies change, the cached value will be recalculated.<br/>
	Here''s what one realistic example might look like.<br/>
	<code>
	const filteredAndSortedItems = React.useMemo(() => {<br/>
	&emsp; return items<br/>
	&emsp;&emsp; .filter(item=>item.name.includes(searchItem))<br/>
	&emsp;&emsp; .sort(a,b)=>a.name.localeCompare(b.name));<br/>
	}, [items, searchItem]);</code>');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm59ftz001bqn6hn0xighjh', 'clq97ec8y0000c6hhcmiakcut', 'Tell me everything you know about React''s useCallback hook.', 'React.useCallback lets you cache a function (and therefore, keep it referentially stable across renders).<br/>
<code>
	const cacheFn = React.useCallback(<br/>
	&emsp;fnToCache,<br/>
	&emsp;dependencies<br/>
	}<br/>
</code>
It''s first argument is the function you want to cache and its 2nd argument is an array of dependencies the function depends on. If any of the dependencies change, the cached function will updated. <br/>
It''s particularly helpful  when you''re creating a custom hook that returns a function. You''ll want to make sure the function''s reference stays stable so you don''t invalidate any **React.Memo** that the consumer of the hook has.<br/>
<code>
	const handleClearInterval = React.useCallback(() => {<br/>
	&emsp; window.clearInterval(id.curren);<br/>
	}, [ ]); <br/>
</code>');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm5fqve001dqn6hy1g6r3o3', 'clq97ec8y0000c6hhcmiakcut', 'How would you integrate a custom data store into your React application?', 'This would be the perfect use case for React''s useSyncExternalStore hook.<br/>
<code>
import * as React from "react"<br/>
import customStore from "./store.ts"<br/>
export default function Component(){<br/>&emsp;const store = useSyncExternalStore(customStore.subscribe, customStore.getSnapShot);<br/>
	&emsp; ....<br/>
	}<br/>
	</code>');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm5sp97001fqn6hpivsaqkn', 'clq97ec8y0000c6hhcmiakcut', 'What is lazy state initialization and when is it useful?', 'It''s rare, but there are times when your initial state is the result of a calculation (usually encapsulated in a function).<br/><code>const [state, setState] = React.useState(getInitialState())</code><br/>
With the code above, even though React will only use the result of getInitialState on the initial render, it''s still being invoked on every re-render - wasting resources.<br/>
To fix this, if you pass a function to useState (as opposed to a function invocation), React will only invoke that function on the initial render in order to get the initial state.<br/><code>const [state, setState] = React.useState(getInitialState)</code>');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm668t1001hqn6hwlpmih4c', 'clq97ec8y0000c6hhcmiakcut', 'What''s the purpose of React''s "useEffectEvent" hook?', 'React.<strong>useEffectEvent</strong> allows you to abstract any reactive but non-synchronizing values into their own event handler that you can then use inside of <strong>useEffect</strong> without needing to declare in <strong>useEffect''s</strong> dependency array.<br/>
<code>const onPageView = React.<strong>useEffectEvent</strong>((url) => {<br/>&emsp;pageView(url, state)<br/>})<br/>React.<strong>useEffect</strong>(() => {<br/>&emsp;onPageView(url)<br/>},[url])</code>');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm68z6r001jqn6hd46abkeq', 'clq97ec8y0000c6hhcmiakcut', 'If React.memo isn''t working appropriately, what is the most likely cause?', 'A prop being passed to the component wrapped in React.memo is a reference value whose reference is changing on every render.');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm6bfbc001lqn6hqf0sscjb', 'clq97ec8y0000c6hhcmiakcut', 'What is "batching" in React?', 'Batching is React''s algorithm for minimizing unnecessary re-renders. It works by taking into account every updater function inside of an event handler before it updates its state and triggers a re-render.');
INSERT INTO QuestionAnswer (id, topicId, question, answer) VALUES ('clqm6wn8i001nqn6h40v01yij', 'clq97ec8y0000c6hhcmiakcut', 'What are the 5 rules for managing side effects in React?', '[Rule #1] - When a <u>component renders</u>, it should <u>do so without running into any side effects</u>.<br>[Rule #2] - If a <u>side effect is triggered by an event</u>, <u>put</u> that <u>side effect in an event handler</u><br>[Rule #3] - If a <u>side effect</u> is <u>synchronizing your component with some outside system</u>, put that side effect inside <strong>useEffect</strong><br>[Rule #4]- If a side effect is synchronizing your <u>component with some outside system and</u> that side effect <u>needs</u> to run <u>before</u> the <u>browser paints the screen</u>,  put that side effect inside <strong>useLayoutEffect</strong><br>[Rule #5] - If a side effect is <u>subscribing to a external store</u>, use the <strong>useSyncExternalStore</strong> hook.');

-- Table: Quiz
CREATE TABLE "Quiz" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "topicId" TEXT NOT NULL,
    "quizQuestion" TEXT NOT NULL,
    CONSTRAINT "Quiz_topicId_fkey" FOREIGN KEY ("topicId") REFERENCES "Topic" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table: QuizAnswers
CREATE TABLE "QuizAnswers" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "quizAnswerOf" TEXT NOT NULL,
    "answer" TEXT NOT NULL,
    CONSTRAINT "QuizAnswers_quizAnswerOf_fkey" FOREIGN KEY ("quizAnswerOf") REFERENCES "Quiz" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table: Topic
CREATE TABLE "Topic" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO Topic (id, title, description, createdAt, updatedAt) VALUES ('clq97ec8y0000c6hhcmiakcut', 'React', 'Learn modern React 18', 1702800408706, 1702800408706);
INSERT INTO Topic (id, title, description, createdAt, updatedAt) VALUES ('clq98p3500001c6hh8zgqoank', 'SQL', 'Master SQL', 1702802589732, 1702802589732);
INSERT INTO Topic (id, title, description, createdAt, updatedAt) VALUES ('clqbyahiv00007ixog23evvfl', 'Discrete Math', 'Math for Computer', 1702966510903, 1702966510903);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
