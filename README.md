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
ollama run deepseek-r1:1.5b
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
http://ollama:11434 # for ollama in docker container  
http://localhost:11434 # for ollama install on the host  
`Default model`
ollama/{qwen3.5:2b}
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

On the host:
```bash
sudo apt install intel-opencl-icd opencl-headers clinfo -y
sudo usermod -aG render $USER
sudo usermod -aG video $USER
docker exec ollama clinfo | grep -i "Intel"
lspci | grep -i vga
lsmod | grep i915
clinfo | grep -i intel

#optional
sudo apt install intel-opencl-icd intel-media-va-driver-non-free libmfx1
```

Update OpenClaw in a container. Pull Ollama model and install Intel graphics driver.

```bash
npm i -g openclaw@latest  

ollama run deepseek-r1:1.5b
apt update && apt install -y intel-opencl-icd clinfo

```

Ollama docker image does not have full intel gpu support. That's why the all cpu cores are used at ~100%.

Test if Openclaw connects to Ollama and preload the model for openclaw.

```bash
docker exec openclaw curl -X POST http://ollama:11434/api/chat -H "Content-Type: application/json" -d '{"model":"deepseek-r1:1.5b","messages":[{"role":"user","content":"Hi!"}]}'

ollama run {model} ""
```

<!--

Ask AI agent:

> BTC-Sentinel, your workspace is ready. Perform a system check: 1) Read STRATEGIST and RISK_MANAGER. 2) Check if you can access the get_btc_price skill. 3) Report status.  

-->