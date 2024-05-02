# SemanticSqueak

Experiments for the master thesis "Augmented Exploratory Programming with Integrated Generative AI Tools". Work in progress.

## Installation

```smalltalk
Metacello new
	baseline: 'SemanticSqueak';
	repository: 'github://LinqLover/SemanticSqueak:main';
	get; "for updates"
	load.
```

## Usage

Warning! Scientific prototype! Not yet ready for production! Read our paper for more current potential and limitations.

There are two ways to open an exploratory programming agent:

- **Standalone:** From the world main docking bar > Apps, choose "ChatGPT for Squeak".
- **Talk with objects:** In the preferences, enable "Integrate semantic agent into inspectors". Then inspect any object and choose "Chat" on the left. Type your question and press <kbd>Cmd</kbd> + <kbd>S</kbd>.

> [!NOTE]
> For a somewhat usable accuracy of the agent, it is recommended to set the default model to GPT-4 (from the window menu of a ChatGPT window or the context menu of the chat field in an inspector).

> [!WARNING]
> Watch your expenses! The exploratory agent consumes a lot of tokens, and especially with GPT-4 those are still expensive. A single question may cost between $0.50 and $2.00.
>
> You can bring up an [OpenAI expense watcher](https://github.com/LinqLover/Squeak-SemanticText#openai-api-expense-watcher) from the chat menu or [track your usage online](https://platform.openai.com/usage).
