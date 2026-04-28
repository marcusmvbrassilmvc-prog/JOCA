# Joca Agent - TODO

## Fase 1: Setup & Assets
- [x] Gerar logo/ícone do Joca (quadrado, sem bordas)
- [x] Gerar assets visuais do Joca (sprite para animação de caminhada)
- [x] Pesquisar/preparar sons estilo Joca (voz robótica, efeitos sonoros)
- [x] Configurar app.config.ts com branding do Joca (nome: Joca do MARCOS)

## Fase 2: Estrutura Base
- [x] Implementar banco de dados local (SQLite com Drizzle ORM)
- [x] Criar contexto global para estado do Joca
- [x] Configurar providers (Theme, Database, Joca State)
- [x] Implementar persistência com AsyncStorage

## Fase 3: Telas Básicas
- [ ] Implementar Splash Screen com animação
- [x] Implementar Onboarding/Checklist de Permissões
- [x] Implementar Home Screen com layout base
- [x] Implementar Chat Screen com histórico
- [x] Implementar Settings Screen

## Fase 4: Overlay Flutuante (Joca)
- [x] Implementar componente FloatingWallE com react-native-reanimated
- [x] Animar caminhada autônoma (movimento contínuo)
- [x] Implementar detecção de toques
- [x] Adicionar menu de ações ao clicar
- [ ] Testar overlay sobre outros apps

## Fase 5: Reconhecimento de Voz
- [x] Integrar expo-audio para captura de microfone
- [x] Implementar speech-to-text (API externa ou nativa)
- [x] Criar interface de captura de áudio
- [ ] Testar reconhecimento em diferentes idiomas

## Fase 6: Síntese de Voz (Text-to-Speech)
- [x] Integrar expo-speech para text-to-speech
- [x] Configurar voz robótica estilo Joca
- [x] Adicionar efeitos sonoros (beeps, boops, sons autênticos)
- [x] Implementar fila de reprodução de áudio
- [x] Integrar sons no Chat Screen
- [x] Integrar sons na Home Screen

## Fase 7: Serviço de Acessibilidade (Nativo)
- [x] Criar módulo Android nativo (Java/Kotlin)
- [x] Implementar AccessibilityService
- [x] Capturar notificações
- [x] Implementar cliques automáticos
- [x] Integrar com React Native via bridge

## Fase 8: Personalidade & Aprendizado
- [ ] Implementar sistema de personalidade (mood, preferências)
- [ ] Criar banco de dados de interações
- [ ] Implementar análise de padrões
- [ ] Adicionar respostas contextuais baseadas em histórico
- [ ] Implementar sugestões proativas

## Fase 9: Integração & Testes
- [ ] Testar fluxo completo de permissões
- [ ] Testar overlay em diferentes apps
- [ ] Testar reconhecimento e síntese de voz
- [ ] Testar Serviço de Acessibilidade
- [ ] Testar persistência de dados
- [ ] Testar em dispositivo real

## Fase 10: Build & Entrega
- [x] Configurar build do APK (EAS Build ou local)
- [x] Gerar instruções de instalação
- [x] Criar guia de permissões para o usuário
- [ ] Testar instalação em dispositivo limpo
- [ ] Preparar arquivo final para download

## Bugs & Issues
(Nenhum registrado ainda)

## Notas
- Joca deve ter personalidade humanizada mas claramente robótica
- Todos os sons devem ser estilo Joca (sons eletrônicos, beeps, etc.)
- O movimento deve ser fluido e natural, não mecânico
- Respeitar privacidade do usuário ao usar Serviço de Acessibilidade

## Fase 11: Personalidade Humanizada (Novo!)
- [x] Implementar sistema de memória (aprender preferências do usuário)
- [x] Criar sistema de emoções (feliz, triste, curioso, cansado)
- [x] Implementar rotina automática (saudações, bom dia/noite)
- [x] Adicionar suporte a apelidos personalizados
- [x] Implementar modo noturno (Joca "dorme")
- [x] Criar reações emocionais baseadas em ações
- [x] Persistir perfil do usuário no banco de dados
- [x] Implementar diário de conversas completo


## Fase 12: Comunicação 100% por Voz (NOVO!)
- [x] Remover Chat Screen com texto
- [x] Implementar reconhecimento de voz (speech-to-text)
- [x] Implementar síntese de voz robótica clara (não beeps)
- [x] Criar interface de gravação de voz na Home
- [x] Integrar resposta automática por voz
- [x] Testar comunicação bidirecional (você fala → Joca responde)
- [x] Remover todas as telas de texto


## Fase 13: Background Service (Joca 24/7)
- [x] Implementar Expo TaskManager para tarefas em background
- [x] Criar serviço de detecção de voz (wake word: "Joca")
- [x] Implementar overlay permanente mesmo com app fechado
- [x] Configurar notificações automáticas periódicas
- [x] Implementar persistência de estado em background
- [x] Testar ativação por voz sem app aberto
- [x] Configurar permissões de background no Android


## Fase 14: App Invisível - Apenas Permissões (NOVO!)
- [x] Remover Home Screen
- [x] Remover Settings Screen
- [x] Remover Memories Screen
- [x] Deixar apenas Checklist de Permissões
- [x] Após autorizar, app fica em background (invisível)
- [x] Joca aparece como overlay flutuante
- [x] Comunicação 100% por voz (sem telas)
- [ ] Testar fluxo: abrir → autorizar → fechar → Joca ativo


## Fase 15: Robô Original Ultra Realista (FINAL!)
- [x] Gerar novo robô de lixo original (estilo Joca)
- [x] Velho, sujo, amarelo com detalhes mecânicos
- [x] Compactar imagens (PNG para WebP)
- [x] Atualizar assets do projeto
