# Joca Agent - Design Document

## Visão Geral
Um aplicativo Android que apresenta o robô Joca como um agente flutuante autônomo que caminha sobre a tela, interage por voz com personalidade robótica, e aprende os costumes do usuário através de um banco de dados local.

## Orientação & Princípios
- **Orientação**: Retrato (9:16) com suporte a modo paisagem
- **Interação**: One-handed usage (botões acessíveis com uma mão)
- **Estilo**: iOS-like com design moderno e responsivo
- **Personalidade**: Joca deve ser amigável, curioso e interativo

---

## Screen List

### 1. **Splash Screen**
- Logo do Joca animado
- Carregamento inicial do banco de dados
- Transição automática para Onboarding

### 2. **Onboarding / Checklist de Permissões**
- Checklist visual com 3 etapas:
  1. ✓ Permissão de Sobreposição (Draw Over Other Apps)
  2. ✓ Permissão de Acessibilidade (Accessibility Service)
  3. ✓ Permissão de Microfone (para reconhecimento de voz)
- Botões "Abrir Configurações" para cada permissão
- Botão "Continuar" (habilitado quando todas as permissões forem concedidas)
- Instruções passo a passo para cada permissão

### 3. **Home Screen (Principal)**
- **Área Central**: Joca flutuante animado (sobreposição)
- **Painel Inferior**: 
  - Botão de Microfone (ativar/desativar reconhecimento de voz)
  - Botão de Chat (histórico de conversas)
  - Botão de Configurações
  - Indicador de status (conectado, ouvindo, processando)
- **Overlay Flutuante**: Joca caminhando autonomamente pela tela

### 4. **Chat Screen**
- Histórico de conversas com Joca
- Entrada de texto para comandos
- Botão de Microfone para entrada por voz
- Respostas do Joca com animações e sons
- Exibição de ações executadas (apps abertos, notificações lidas)

### 5. **Settings Screen**
- Controle de volume do Joca
- Ativar/desativar movimento autônomo
- Ativar/desativar sons
- Limpar histórico de aprendizado
- Sobre o app

### 6. **Accessibility Service Configuration**
- Tela nativa do Android para configurar o Serviço de Acessibilidade
- Instruções visuais sobre como ativar

---

## Primary Content and Functionality

### Screen 1: Splash Screen
- **Conteúdo**: Logo animado do Joca, barra de carregamento
- **Funcionalidade**: Inicializar banco de dados, carregar preferências do usuário

### Screen 2: Onboarding / Checklist
- **Conteúdo**: 
  - Título: "Bem-vindo ao Joca Agent"
  - Descrição: "Vou precisar de algumas permissões para funcionar"
  - Lista de 3 permissões com checkboxes
  - Instruções passo a passo
- **Funcionalidade**: 
  - Verificar status de cada permissão
  - Abrir telas de configuração do Android
  - Validar permissões concedidas
  - Navegar para Home quando tudo estiver pronto

### Screen 3: Home Screen (Principal)
- **Conteúdo**:
  - Joca flutuante no centro/canto da tela
  - Painel de controle inferior com 4 botões
  - Indicador de status (texto + ícone)
- **Funcionalidade**:
  - Renderizar Joca como overlay flutuante
  - Animar movimento autônomo (caminhada, rotação)
  - Ativar/desativar microfone
  - Navegar para Chat e Settings
  - Executar comandos do Serviço de Acessibilidade

### Screen 4: Chat Screen
- **Conteúdo**:
  - Lista de mensagens (usuário à direita, Joca à esquerda)
  - Campo de entrada de texto
  - Botão de Microfone
  - Animações de digitação/processamento
- **Funcionalidade**:
  - Enviar mensagens de texto
  - Capturar áudio por voz
  - Exibir respostas do Joca com som
  - Registrar no banco de dados para aprendizado
  - Executar ações (abrir apps, clicar botões)

### Screen 5: Settings Screen
- **Conteúdo**:
  - Toggle: Movimento Autônomo
  - Toggle: Sons do Joca
  - Slider: Volume
  - Botão: Limpar Histórico
  - Botão: Sobre
- **Funcionalidade**:
  - Persistir preferências em AsyncStorage
  - Atualizar comportamento do Joca em tempo real

---

## Key User Flows

### Flow 1: Inicialização do App
1. Usuário abre o app
2. Splash Screen carrega (1-2 segundos)
3. Se primeira execução → Onboarding
4. Se permissões não concedidas → Checklist
5. Se tudo OK → Home Screen com Joca

### Flow 2: Concessão de Permissões
1. Usuário vê Checklist
2. Clica em "Abrir Configurações" para Sobreposição
3. Android abre tela de configurações
4. Usuário ativa a permissão
5. Volta para o app (app detecta mudança)
6. Checkbox é marcado automaticamente
7. Repete para Acessibilidade e Microfone
8. Quando tudo estiver pronto, botão "Continuar" fica habilitado

### Flow 3: Interação com Joca (Voz)
1. Usuário clica no botão de Microfone
2. App começa a capturar áudio
3. Indicador muda para "Ouvindo..."
4. Usuário fala um comando (ex: "Abra o WhatsApp")
5. App processa o áudio (speech-to-text)
6. Joca responde com som robótico (text-to-speech)
7. App executa a ação (Serviço de Acessibilidade)
8. Resultado é exibido no Chat

### Flow 4: Movimento Autônomo do Joca
1. Home Screen está ativa
2. Joca caminha autonomamente pela tela
3. Movimento é contínuo enquanto o app estiver em foreground
4. Ao clicar em Joca, ele para e exibe menu de ações
5. Usuário pode falar comando ou clicar em ação

### Flow 5: Aprendizado de Costumes
1. Cada interação é registrada no banco de dados
2. Sistema analisa padrões (apps mais usados, horários, comandos frequentes)
3. Joca oferece sugestões proativas
4. Personalidade evolui com base no histórico

---

## Color Choices

### Paleta de Cores (Tema Claro)
| Token | Cor | Uso |
|-------|-----|-----|
| `primary` | #FFB81C (Amarelo Joca) | Botões primários, destaques |
| `background` | #FFFFFF | Fundo das telas |
| `surface` | #F5F5F5 | Cards, superfícies elevadas |
| `foreground` | #1A1A1A | Texto principal |
| `muted` | #666666 | Texto secundário |
| `border` | #E0E0E0 | Divisores, bordas |
| `success` | #4CAF50 | Ações bem-sucedidas |
| `warning` | #FF9800 | Avisos |
| `error` | #F44336 | Erros |

### Paleta de Cores (Tema Escuro)
| Token | Cor | Uso |
|-------|-----|-----|
| `primary` | #FFB81C (Amarelo Joca) | Botões primários, destaques |
| `background` | #121212 | Fundo das telas |
| `surface` | #1E1E1E | Cards, superfícies elevadas |
| `foreground` | #FFFFFF | Texto principal |
| `muted` | #999999 | Texto secundário |
| `border` | #333333 | Divisores, bordas |
| `success` | #66BB6A | Ações bem-sucedidas |
| `warning` | #FFA726 | Avisos |
| `error` | #EF5350 | Erros |

### Identidade Visual do Joca
- **Cor Primária**: Amarelo (#FFB81C) - cor icônica do Joca
- **Cor Secundária**: Preto/Cinza escuro (#333333) - corpo do robô
- **Acentos**: Azul claro (#0288D1) - olhos do Joca

---

## Componentes Principais

### 1. FloatingWallE (Overlay Flutuante)
- Renderizado como overlay sobre todos os apps
- Animação contínua de caminhada
- Responsivo a toques
- Movimento autônomo (IA simples)

### 2. VoiceRecognition (Reconhecimento de Voz)
- Captura áudio do microfone
- Converte para texto (speech-to-text)
- Processa comandos

### 3. TextToSpeech (Síntese de Voz)
- Converte texto em áudio
- Voz robótica estilo Joca
- Reprodução com efeitos sonoros

### 4. AccessibilityService (Serviço de Acessibilidade)
- Lê notificações
- Clica em botões
- Abre apps
- Executa ações do sistema

### 5. LocalDatabase (Banco de Dados Local)
- SQLite ou Realm
- Armazena histórico de interações
- Aprende padrões de uso
- Personalidade persistente

---

## Estrutura de Dados

### User Profile
```
{
  id: string,
  name: string,
  createdAt: Date,
  preferences: {
    autoMove: boolean,
    soundEnabled: boolean,
    volume: number
  },
  personality: {
    mood: 'happy' | 'curious' | 'tired',
    learnedApps: string[],
    favoriteCommands: string[]
  }
}
```

### Interaction Log
```
{
  id: string,
  timestamp: Date,
  type: 'voice' | 'text' | 'action',
  input: string,
  output: string,
  action: string | null,
  success: boolean
}
```

---

## Próximos Passos
1. Gerar assets visuais do Joca (PNG, SVG)
2. Implementar overlay flutuante
3. Integrar reconhecimento de voz
4. Configurar Serviço de Acessibilidade nativo
5. Implementar banco de dados local
6. Testar em dispositivo real
