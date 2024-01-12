#tweetを投稿
 
import tweepy
 
# 取得した各種キーを格納-----------------------------------------------------
consumer_key =""
consumer_secret =""
access_token=""
access_token_secret =""
 
api = tweepy.Client(bearer_token="")

from vertexai.language_models import ChatModel, InputOutputTextPair

x = input('AIに送るXのポストを入力 : ')

def science_tutoring(temperature: float = 0.2) -> None:
    chat_model = ChatModel.from_pretrained("chat-bison@001")

    # TODO developer - override these parameters as needed:
    parameters = {
        "temperature": temperature,  # Temperature controls the degree of randomness in token selection.
        "max_output_tokens": 256,  # Token limit determines the maximum amount of text output.
        "top_p": 0.95,  # Tokens are selected from most probable to least until the sum of their probabilities equals the top_p value.
        "top_k": 40,  # A top_k of 1 means the selected token is the most probable among all tokens.
    }

    chat = chat_model.start_chat(
        context="My name is Miles. You are an astronomer, knowledgeable about the solar system.",
        examples=[
            InputOutputTextPair(
                input_text="How many moons does Mars have?",
                output_text="The planet Mars has two moons, Phobos and Deimos.",
            ),
        ],
    )

    response = chat.send_message(
        x, **parameters
    )
    print(f"Response from Model: {response.text}")

    api.create_tweet(text="My PostRequest is:" + x + "\n" + f"Response from Model by PaLM 2: {response.text}")

    return response

if __name__ == "__main__":
    science_tutoring()