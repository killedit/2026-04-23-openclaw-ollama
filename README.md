# Openclaw and Ollama docker setup

Clone the repository and build the containers.

```bash
git clone 2026-04-23-openclaw-ollama
cd 2026-04-23-openclaw-ollama
docker compose up -d
```

Download Ollama model:

```bash
docker exec -it ollama bash
ollama ls
ollama run qwen3.5:2b
```

Run OpenClaw onboarding.</br>

`You need to check the context window (ollama ps) of the model you want to use. Smaller models than qwen3.5:2b won't work.`

```bash
docker exec -it openclaw bash
openclaw onboard
```

I understand this is personal-by-default and shared/multi-user use requires lock-down. Continue?</br>
>Yes</br>
Setup mode</br>
>QuickStart</br>
Config handling</br>
>Update values</br>
Model/auth provider</br>
>Ollama</br>
Ollama mode</br>
>Local only</br>
Ollama base URL</br>
>http://ollama:11434</br>
Default model</br>
>ollama/qwen3.5:2b</br>
Websearch</br>
>Gemini</br>
>{optionally your API key if you need websearch}</br>
How do you want to hatch your bot?</br>
>Hatch in Terminal (recommended)</br>

Get your Gateway Token:
```bash
docker exec openclaw cat /root/.openclaw/openclaw.json | grep "token"
```

Paste it at OpenClaw welcome page:

Openclaw | http://localhost:18789
--- | ---
Ollama Health Check | http://localhost:11434


Then click:
</br><button style="background:#ff2c2c;color:#fff;border:none;padding:8px 14px;border-radius:6px;cursor:pointer;">Connect</button>

Monitor docker logs and the used resources:

```bash
docker compose logs -f
docker stats
```
