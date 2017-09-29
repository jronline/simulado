module ApplicationHelper
    def t_boolean(expression)
        (expression) ? t("Sim") : t("Não")
    end
    
end
