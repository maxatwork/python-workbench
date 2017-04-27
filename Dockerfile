FROM ubuntu:latest

RUN apt-get update && apt-get update
RUN apt-get install -qy curl locales language-pack-ru git-all zsh vim python3 ipython3 ipython3-notebook
RUN echo "export LANG=ru_RU.UTF-8" >> ~/.bashrc
RUN locale-gen

# Oh-my-zsh
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
RUN cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
RUN sed -i s/plugins=\(git\)/plugins\=\(git\ python\ pip\ virtualenv\ pep8\)/ ~/.zshrc
RUN echo "export LANG=ru_RU.UTF-8" >> ~/.zshrc
RUN chsh -s /bin/zsh

WORKDIR /root/workspace

CMD zsh
