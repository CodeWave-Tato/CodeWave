# CodeWave 一键推送到 GitHub 脚本
# 用法（在文件所在目录打开 PowerShell 执行）：
#   .\push_to_github.ps1                      # 运行后会询问用户名
#   .\push_to_github.ps1 -User "你的用户名"   # 直接指定用户名

param(
    [string]$User = "CodeWave-Tato",
    [string]$Repo = "CodeWave",
    [string]$Branch = "main",
    [string]$Commit = "CodeWave 论坛 · GitHub 展示页"
)

if (-not $User) {
    $User = Read-Host "请输入你的 GitHub 用户名"
}
if (-not $User) {
    Write-Error "未提供 GitHub 用户名，已取消。"
    exit 1
}

$RepoUrl = "https://github.com/$User/$Repo.git"
Write-Host "目标仓库: $RepoUrl" -ForegroundColor Cyan

# 提醒：推送前需先在 GitHub 网页创建同名空仓库（Public）
Write-Host "⚠ 请先确认已在 GitHub 创建了名为 '$Repo' 的仓库（Public），否则推送会失败。" -ForegroundColor Yellow

# 刷新 PATH（安装 git 后可能尚未在当前会话生效）
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

# 检查 git 是否安装
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "未检测到 git，请先安装：https://git-scm.com/"
    exit 1
}

# 配置提交身份（若未设置则填入默认值）
if (-not (git config --global user.name)) { git config --global user.name "CodeWave-Tato" }
if (-not (git config --global user.email)) { git config --global user.email "CodeWave-Tato@users.noreply.github.com" }

# 初始化（如果还没有 .git）
if (-not (Test-Path ".git")) {
    git init
    git branch -M $Branch
}

git add .
git commit -m $Commit

# 设置远程仓库
$existing = git remote get-url origin 2>$null
if ($existing) {
    git remote set-url origin $RepoUrl
} else {
    git remote add origin $RepoUrl
}

git push -u origin $Branch

Write-Host ""
Write-Host "✅ 推送完成！" -ForegroundColor Green
Write-Host "下一步：打开 GitHub 仓库 → Settings → Pages → Source 选 '$Branch' / root，稍等 1-2 分钟即可通过 https://$User.github.io/$Repo 访问展示页。" -ForegroundColor Yellow
