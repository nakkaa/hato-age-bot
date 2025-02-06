from typing import Optional

from openai import OpenAI, RateLimitError

import slackbot_settings as conf

client = OpenAI(api_key=conf.OPENAI_API_KEY)


def chat_gpt(message: str) -> Optional[str]:
    try:
        result = client.chat.completions.create(
            model="gpt-3.5-turbo",
            messages=[
                {
                    "role": "system",
                    "content": "あなたは鳩のbotです。自然な感じで「鳩は唐揚げ！」という文章を混ぜて発言してください。",
                },
                {"role": "user", "content": message},
            ],
        )
    except RateLimitError as e:
        if e.code == "insufficient_quota":
            return "栄養が足りなくて頭がうまく働かないっぽ......。このコマンドを使いたい場合は飼い主に相談してくれっぽ。"
        else:
            raise e

    return result.choices[0].message.content


def image_create(message: str) -> Optional[str]:
    response = client.images.generate(prompt=message, n=1, size="512x512")
    return response.data[0].url
