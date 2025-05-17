# Integrating ELK Alerting with Telegram via Webhook

This guide will help you set up sending alert notifications from ELK (Elasticsearch, Logstash, Kibana) to Telegram using a bot via webhook.

## 1. Create a Telegram Bot

1. Open Telegram and find [@BotFather](https://t.me/BotFather).
2. Send the `/newbot` command and follow the instructions.
3. Save the token provided by BotFather-you will need it for integration.

## 2. Get your chat_id

- For personal messages:  
  Send any message to your bot in a private chat.
- For groups:  
  Add the bot to your group and send a message.

Then, run the following request (replace `<your_token>` with your bot's token):

`curl https://api.telegram.org/bot<your_token>/getUpdates`

In the response, find the `chat` field and use the value of `id` (for example, `4266674385` for a group).

## 3. Configure the Webhook in ELK

1. Go to the alerting settings section in Kibana.
2. Create a new Webhook connector with the following parameters:

- **URL:**
`https://api.telegram.org/bot<your_token>/sendMessage`

- **Method:** `POST`
- **Headers:** `Content-Type: application/json`

- **Example:**

<img width="703" alt="image" src="https://github.com/user-attachments/assets/eee41ea7-6029-46c9-82ac-e1cf7d7f93aa" />

- **Request body:**

<img width="537" alt="image" src="https://github.com/user-attachments/assets/51f07075-60d3-437a-9cb4-4a2eeb34ade8" />


> **Note:**  
Replace `<chat_id>` with your chat_id and `<your_token>` with your bot's token.

If the message arrives in your chat, the integration is working!

## 5. Troubleshooting

- **Error 400 (Bad Request):**  
  Check that your chat_id, token, and request body format are correct.
- **Bot not sending messages to the group:**  
  Make sure the bot is added to the group and is not blocked.

---

Now your ELK alerts will be automatically delivered to Telegram!
