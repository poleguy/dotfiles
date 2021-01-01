# https://news.ycombinator.com/item?id=25549462
# dotfiles in this directory are managed in git
# to start from scratch:
# https://github.com/tmm/dotfiles
# alias h="env GIT_WORK_TREE=$HOME GIT_DIR=$HOME/.dotfiles"
alias git_dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

git_dotfiles init --bare $HOME/.dotfiles
git_dotfiles config --local status.showUntrackedFiles no
git_dotfiles remote add origin https://github.com/poleguy/dotfiles.git
git_dotfiles fetch
git_dotfiles checkout master
echo "*" >> .gitignore

# echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc

# to add files:
h git add readme.md -f
h git commit
h git push origin

# to pull into a new computer:
# https://news.ycombinator.com/item?id=25549462

#git clone https://github.com/poleguy/dotfiles.git
#cd dotfiles
#./setup


