# syntax=docker/dockerfile:1

ARG BASE_IMAGE
FROM "${BASE_IMAGE}"

ARG USERNAME
RUN <<-"EOF"
  set -e
  ssh-keygen -A
  addgroup -g 1000 "${USERNAME}"
  adduser -D -G "${USERNAME}" -h "/home/${USERNAME}" -s /bin/zsh -u 1000 "${USERNAME}"
  echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" | tee "/etc/sudoers.d/${USERNAME}" >/dev/null
EOF
USER "${USERNAME}"
WORKDIR "/home/${USERNAME}"

RUN <<-"EOF"
  set -e
  git clone https://github.com/ZhongRuoyu/dotfiles.git ~/.local/share/dotfiles
  ~/.local/share/dotfiles/install.sh
EOF

CMD [ "zsh", "-il" ]
