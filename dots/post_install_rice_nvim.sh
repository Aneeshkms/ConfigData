echo "-~-~-~-~-~-~-~-~-~-~Install nerdps1" && sleep 1
mkdir -p ~/.config/bash/
curl -sL -o ~/.config/bash/nerdps1 'https://raw.githubusercontent.com/joknarf/nerdps1/main/nerdps1'
echo "# Enable nerdps1 and set style to matrix ">> ~/.bashrc
echo source ~/.config/bash/nerdps1 >> ~/.bashrc
ps1_style matrix  # TODO make this as tmux popup
echo "#">> ~/.bashrc
echo "-~-~-~-~-~-~-~-~-~-~Install wl-clipboard for system clipboard" && sleep 1
sudo pacman -S --needed wl-clipboard
echo "-~-~-~-~-~-~-~-~-~-~Install luarocks, fzf and ripgrep" && sleep 1
sudo pacman -S --needed luarocks fzf ripgrep # TODO check the packages
echo "install java jdk - use sdkman" && sleep 1
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 25.0.3-tem
echo "-~-~-~-~-~-~-~-~-~-~Install nvm and node" && sleep 1
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
source ~/.bashrc
nvm install --lts
echo "-~-~-~-~-~-~-~-~-~-~Install Python - miniconda " && sleep 1
yay -S miniconda3
echo "[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh" >> ~/.bashrc
conda activate base
echo "-~-~-~-~-~-~-~-~-~-~Install go for lsp" && sleep 1
sudo pacman -S go
echo "-~-~-~-~-~-~-~-~-~-~Install clang and rust fastfetch" && sleep 1
sudo pacman -S clang rustup fastfetch
rustup default stable
source ~/.bashrc
echo "-~-~-~-~-~-~-~-~-~-~Install Tmux" && sleep 1
sudo pacman -S tmux
echo "-~-~-~-~-~-~-~-~-~-~Install Tmux plugin manager tpm" && sleep 1
mkdir -p ~/.tmux/plugins/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "-~-~-~-~-~-~-~-~-~-~Install lazygit" && sleep 1
sudo pacman -S --needed lazygit
echo "-~-~-~-~-~-~-~-~-~-~Install treesitter cli" && sleep 1
cargo install --locked tree-sitter-cli
echo "export PATH=\"$PATH:$HOME/.cargo/bin/\"" >> ~/.bashrc  # TODO check if this needed
echo "-~-~-~-~-~-~-~-~-~-~Copy dotfiles" && sleep 1
cp -r ~/shared/config/* ~/.config/    # TODO make this as git clone from my git
nvim --headless "+Lazy! install" +qa
# nvim --headless -c "MasonInstall luacheck stylua flake8 black revive gofumpt prettierd eslint_d fixjson shellcheck shfmt hadolint cpplint clang-format" -c "qa"
nvim --headless  "+MasonInstall luacheck stylua flake8 black revive gofumpt prettierd eslint_d fixjson shellcheck shfmt hadolint cpplint clang-format" +qa



