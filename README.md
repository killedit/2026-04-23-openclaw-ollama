# Openclaw and Ollama Docker setup

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
ollama run {qwen3.5:2b}
```

Run OpenClaw onboarding.</br>

You need to check the context window (ollama ps) of the model you want to use. Smaller models than {qwen3.5:2b} won't work with skills. *
* On a x86 system without dedicated graphic's card skills will make the context too large to be handled by local ollama model before timing out so you have to skip it.

```bash
docker exec -it openclaw bash
openclaw onboard
```

`I understand this is personal-by-default and shared/multi-user use requires lock-down. Continue?`
Yes  
`Setup mode`
QuickStart  
`Config handling`
Update values  
`Model/auth provider`
Ollama  
`Ollama mode`
Local only  
`Ollama base URL`
http://ollama:11434  
`Default model`
ollama/{qwen2.5:1.5b}
`Websearch`
Gemini {optionally your API key if you need websearch}  
`How do you want to hatch your bot?`
Hatch in Terminal (recommended)

This way you can test it in the terminal first before interacting in the web interface.  

Get your Gateway Token: 

```bash
docker exec openclaw cat /root/.openclaw/openclaw.json | grep "token"
```

Paste it at OpenClaw welcome page:

Openclaw | http://localhost:18789
--- | ---
Ollama Health Check | http://localhost:11434

Monitor docker logs and the used resources:

```bash
docker compose logs -f
docker stats
```
