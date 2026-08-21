# CodeWave 推广展示页

本仓库用于 **GitHub 宣传引流**，是一个独立的静态展示页（`index.html`），并非完整论坛源码。

## 内容
- `index.html`：展示页（功能介绍 + 界面截图 + GitHub 引流）。
- `screenshots/`：放置界面截图，详见该目录下的说明。
- `push_to_github.ps1`：一键推送到 GitHub 的脚本。

## 使用方法
1. 把你的界面截图按 `screenshots/README.md` 的命名放进 `screenshots/`。
2. 右键 `push_to_github.ps1` → 用 PowerShell 运行，按提示输入 GitHub 用户名。
   （或终端执行：`.\push_to_github.ps1 -User "CodeWave-Tato"`）
3. 在 GitHub 仓库 → Settings → Pages → Source 选 `main` / root，即可通过 `https://CodeWave-Tato.github.io/CodeWave` 访问。

> 当前项目暂无线上域名，仅作展示。

<!-- Tato · CodeWave -->
