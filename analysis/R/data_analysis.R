# Install and load the necessary packages
pacman::p_load(tidyverse, ggplot2, ez)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# # Load the results file
df <- read.csv("D:/GitHub/NeuroAIT_DecisionMakingData/data/behavior/behavior_data.csv")

# Add a new variable trial_number
df$trial_number <- df$trials.thisRepN + 1

# Convert the variables to factors for grouping
df$condition_tool <- as.factor(df$condition_tool)
df$condition_unce <- as.factor(df$condition_unce)

# Average all participants for each trial
df %>%
  group_by(condition_tool, condition_unce, trial_number) %>%
  summarise(response_time_mean = mean(response_time), 
            score_mean = mean(score),
            wins_mean = mean(wins)) -> df_by_trial

# Obtain the averages for each participant
df %>%
  group_by(ID, condition_tool, condition_unce) %>%
  summarise(response_time_mean = mean(response_time), 
            score_mean = mean(score),
            wins_mean = mean(wins)) -> df_means

##########################################################################
##########################################################################
##Results
##########################################################################
##########################################################################

# Create the line graph using ggplot and ggsmooth
ggplot(df_by_trial, aes(x = trial_number, 
               y = response_time_mean, 
               color = condition_unce, 
               linetype = condition_tool)) +
  geom_line() +
  labs(x = "Trial number",
       y = "Reponse time (ms)") +
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
       y = "Reponse time (ms)") +
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

# Line graph for the variable score
  
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
  
# Line graph for the variable wins
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

# ANOVA with the ez package
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

# Plot by condition
ggplot(df_means, aes(y = response_time_mean, 
                     x = condition_tool,
                     color = condition_unce)) +
  geom_violin() +
  labs(y = "Reponse time (ms)") +
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