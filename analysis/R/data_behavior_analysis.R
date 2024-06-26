# Instala e carga los paquetes necesarios
library("pacman")
pacman::p_load(tidyverse, ggplot2, ez)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))



# Carga el dataframe desde el archivo CSV
df <- read.csv("D:/OneDrive - Instituto Tecnologico y de Estudios Superiores de Monterrey/Documentos/IGT/Articulo_01_2/data_03_analysis/behavior/data_behavior.csv")

#Obetine los datos demograficos
# Colapsar el dataframe para que solo haya una fila por cada ID diferente
df_collapsed <- df[!duplicated(df$ID), ]
# Conservar solo las columnas ID, sex y age
df_demographic <- df_collapsed[, c("ID", "sex", "age")]
# Eliminar el dataframe df_collapsed
rm(df_collapsed)
# Calcular el total de casos y cuántos son hombres
total_sex <- nrow(df_demographic)
total_men <- sum(df_demographic$sex == "men")
total_women <- sum(df_demographic$sex == "women")



# Convierte las variables a factores para el agrupamiento
df$condition_tool <- as.factor(df$condition_tool)
df$condition_unce <- as.factor(df$condition_unce)

###Promedia a todos los participantes por cada ensayo
df %>%
  group_by(condition_tool, condition_unce, trial_number) %>%
  summarise(response_time_mean = mean(response_time), 
            score_mean = mean(score),
            wins_mean = mean(wins)) -> df_by_trial

##Ontiene los promedios para cada participante
df %>%
  group_by(ID, condition_tool, condition_unce) %>%
  summarise(response_time_mean = mean(response_time), 
            score_mean = mean(score),
            wins_mean = mean(wins)) -> df_means

##########################################################################
##########################################################################
##Resultados
##########################################################################
##########################################################################

# Crea la gráfica de líneas usando ggplot y ggsmooth
ggplot(df_by_trial, aes(x = trial_number, 
               y = response_time_mean, 
               color = condition_unce, 
               linetype = condition_tool)) +
  geom_line() +
  labs(x = "Trial number",
       y = "Reponse time (s)") +
  scale_color_manual(name = "Complexity", 
                     limits=c("LOWU","HIGU"),
                     labels = c("Low","High"),
                     values = c("blue", "red")) +
  scale_linetype_manual(name = "AIT", 
                        limits=c("NAIT","WAIT"),
                        labels = c("Without","With"), 
                        values = c("dotted", "solid")) +
  theme_minimal()
ggsave("results/trials_time_line.jpg")

ggplot(df, aes(x = trial_number, 
               y = response_time, 
               color = condition_unce, 
               linetype = condition_tool)) +
  geom_smooth() +
  labs(x = "Trial number",
       y = "Reponse time (s)") +
  scale_color_manual(name = "Complexity", 
                       limits=c("LOWU","HIGU"),
                       labels = c("Low","High"),
                       values = c("blue", "red")) +
  scale_linetype_manual(name = "AIT", 
                        limits=c("NAIT","WAIT"),
                        labels = c("Without","With"), 
                        values = c("dotted", "solid")) +
  theme_minimal()
  ggsave("results/trials_time_smooth.jpg")

# Gráfica de líneas para la variable score
  
  ggplot(df_by_trial, aes(x = trial_number, 
                 y = score_mean, 
                 color = condition_unce, 
                 linetype = condition_tool)) +
    geom_line() +
    labs(x = "Trial number",
         y = "Score") +
    scale_color_manual(name = "Complexity", 
                       limits=c("LOWU","HIGU"),
                       labels = c("Low","High"),
                       values = c("blue", "red")) +
    scale_linetype_manual(name = "AIT", 
                          limits=c("NAIT","WAIT"),
                          labels = c("Without","With"), 
                          values = c("dotted", "solid")) +
    theme_minimal()
  ggsave("results/trials_score_line.jpg") 
  
ggplot(df, aes(x = trial_number, 
               y = score, 
               color = condition_unce, 
               linetype = condition_tool)) +
  geom_smooth() +
  labs(x = "Trial number",
       y = "Score") +
  scale_color_manual(name = "Complexity", 
                     limits=c("LOWU","HIGU"),
                     labels = c("Low","High"),
                     values = c("blue", "red")) +
  scale_linetype_manual(name = "AIT", 
                        limits=c("NAIT","WAIT"),
                        labels = c("Without","With"), 
                        values = c("dotted", "solid")) +
  theme_minimal()
ggsave("results/trials_score_smooth.jpg")  
  
# Gráfica de líneas para la variable wins
ggplot(df_by_trial, aes(x = trial_number, 
                        y = wins_mean, 
                        color = condition_unce, 
                        linetype = condition_tool)) +
  geom_line() +
  labs(x = "Trial number",
       y = "Wins per trial") +
  scale_color_manual(name = "Complexity", 
                     limits=c("LOWU","HIGU"),
                     labels = c("Low","High"),
                     values = c("blue", "red")) +
  scale_linetype_manual(name = "AIT", 
                        limits=c("NAIT","WAIT"),
                        labels = c("Without","With"), 
                        values = c("dotted", "solid")) +
  theme_minimal()
ggsave("results/trials_wins_line.jpg") 

  ggplot(df, aes(x = trial_number, 
                 y = wins, 
                 color = condition_unce, 
                 linetype = condition_tool)) +
    geom_smooth() +
    labs(x = "Trial number",
         y = "Wins per trial") +
    scale_color_manual(name = "Complexity", 
                       limits=c("LOWU","HIGU"),
                       labels = c("Low","High"),
                       values = c("blue", "red")) +
    scale_linetype_manual(name = "AIT", 
                          limits=c("NAIT","WAIT"),
                          labels = c("Without","With"), 
                          values = c("dotted", "solid")) +
    theme_minimal()
  ggsave("results/trials_wins_smooth.jpg")  

#ANOVA con paquetería ez
ANOVA_response_time <- ezANOVA(data = df_means, dv = response_time_mean, 
                      wid = ID, within = .(condition_tool,condition_unce))

ANOVA_score <- ezANOVA(data = df_means, dv = score_mean, 
                               wid = ID, within = .(condition_tool,condition_unce))

##Gráficasinteracción
###Colapsa las medias por celda 
df_ANOVA <-  df_means %>%
  group_by(condition_tool,condition_unce) %>%
  summarise(score_mean_ANOVA = mean(score_mean), 
            response_time_mean_ANOVA = mean(response_time_mean))

#Grafica por condición
ggplot(df_means, aes(y = response_time_mean, 
                     x = condition_tool,
                     color = condition_unce)) +
  geom_violin() +
  labs(y = "Reponse time (s)") +
  scale_color_manual(name = "Complexity", 
                     limits=c("LOWU","HIGU"),
                     labels = c("Low","High"),
                     values = c("blue", "red")) +
  scale_x_discrete(name = "AIT", 
                        limits=c("NAIT","WAIT"),
                        labels = c("Without","With")) +
  theme_minimal()
ggsave("results/trials_time_condition.jpg")

ggplot(df_means, aes(y = score_mean, 
                     x = condition_tool,
                     color = condition_unce)) +
  geom_violin() +
  labs(y = "Score") +
  scale_color_manual(name = "Complexity", 
                     limits=c("LOWU","HIGU"),
                     labels = c("Low","High"),
                     values = c("blue", "red")) +
  scale_x_discrete(name = "AIT", 
                   limits=c("NAIT","WAIT"),
                   labels = c("Without","With")) +
  theme_minimal()
ggsave("results/trials_score_condition.jpg")


