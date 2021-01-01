# https://news.ycombinator.com/item?id=25549462
# dotfiles in this directory are managed in git
# to start from scratch:
# https://github.com/tmm/dotfiles

# alias git_dotfiles="env GIT_WORK_TREE=$HOME GIT_DIR=$HOME/.dotfiles git"
# alias git_dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
# 
#./git_dotfiles is a command that works on the bare directory

# to bootstrap a new machine:
wget https://github.com/poleguy/dotfiles/blob/master/dotfiles_setup
chmod ugo+x dotfiles_setup
./dotfiles_setup


# note, that gitignore includes everything, so anything new most be added explicitly
echo "*" >> .gitignore

# after bootstrap, you can use ./git_dotfiles which is easier to find than remembering the alias
# to add files:
./git_dotfiles add readme.md -f

#status
./git_dotfiles satus

# check for updates
./git_dotfiles difftool
meld .
#add updates
./git_dotfiles add -u
./git_dotfiles commit
./git_dotfiles push origin master

# to pull into a new computer:
# https://news.ycombinator.com/item?id=25549462

#git clone https://github.com/poleguy/dotfiles.git
#cd dotfiles
#./setup
