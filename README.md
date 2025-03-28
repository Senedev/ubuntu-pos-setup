
# Ubuntu Post-Install Setup Script

## O que é o script?

O **Ubuntu Post-Install Setup Script** é uma solução automatizada para configurar rapidamente um ambiente de trabalho logo após a instalação do sistema operacional. Ele realiza uma série de ajustes essenciais e instala softwares comumente utilizados, facilitando o processo de pós-instalação. O objetivo principal é economizar tempo na configuração inicial e garantir que o sistema esteja otimizado e pronto para uso.

## Funcionalidades Principais

O script oferece as seguintes funcionalidades, todas ajustáveis através de variáveis configuráveis no início do arquivo:

- **Atualização do sistema**: Instala atualizações pendentes e remove pacotes obsoletos.
- **Instalação de ferramentas essenciais**: Instala uma série de softwares como `git`, `curl`, `vim`, entre outros.
- **Instalação de pacotes de desenvolvimento**: Inclui linguagens de programação e ferramentas como Python, Node.js, Docker, etc.
- **Configuração de alias e ajustes de terminal**: Melhora a experiência no terminal com alias úteis.
- **Ajustes de performance e segurança**: Configurações básicas de otimização e segurança do sistema.
- **Instalação e configuração de utilitários**: Como o `htop`, `net-tools`, entre outros.

## Como Executar

### No Ubuntu

1. **Baixar o script:**

   Clone o repositório ou baixe o script diretamente:

   ```bash
   git clone https://github.com/Senedev/ubuntu-pos-setup.git
   ```

2. **Dar permissão de execução ao script:**

   Navegue até o diretório onde o script está localizado e use o seguinte comando:

   ```bash
   chmod +x ubuntu-pos-setup.sh
   ```

3. **Editar as opções de configuração (Opcional):**

   Caso queira personalizar as opções de instalação (como pacotes extras ou configurações específicas), edite as variáveis no início do arquivo `ubuntu-pos-setup.sh` conforme necessário.

4. **Executar o script:**

   Execute o script com o seguinte comando:

   ```bash
   sudo ./ubuntu-pos-setup.sh
   ```

5. **Acompanhar as etapas:**

   O script executará as etapas uma a uma, como atualização do sistema, instalação de pacotes e ajustes de configurações. Todo o processo será exibido no terminal para acompanhamento.

## Requisitos

- **Sistema Operacional:** Ubuntu 18.04 ou superior.
- **Permissões:** A execução requer privilégios de superusuário (root ou sudo).
