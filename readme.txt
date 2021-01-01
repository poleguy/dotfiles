# https://news.ycombinator.com/item?id=25549462
# dotfiles in this directory are managed in git
# to start from scratch:
# https://github.com/tmm/dotfiles

# alias git_dotfiles="env GIT_WORK_TREE=$HOME GIT_DIR=$HOME/.dotfiles git"
# alias git_dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
# 
#./git_dotfiles is a command that works on the bare directory

# to bootstrap a new machine:
git clone --bare git@github.com:poleguy/dotfiles.git $HOME/.dotfiles
alias git_dotfiles="env GIT_WORK_TREE=$HOME GIT_DIR=$HOME/.dotfiles git"


# git_dotfiles remote add origin git@github.com:poleguy/dotfiles.git
#./git_dotfiles remote add origin https://github.com/poleguy/dotfiles.git
#./git_dotfiles remote set-url origin git@github.com:poleguy/dotfiles.git

# this won't work without first removing pre-existing working files

mkdir -p .dotfiles-backup
git_dotfiles checkout master
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    git_dotfiles checkout 2>&1 | egrep "^\s+" | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;
git_dotfiles checkout master
git_dotfiles config --local status.showUntrackedFiles no


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
./git_dotfiles push origin

# to pull into a new computer:
# https://news.ycombinator.com/item?id=25549462

#git clone https://github.com/poleguy/dotfiles.git
#cd dotfiles
#./setup


