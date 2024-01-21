class BudgetPresenter < Keynote::Presenter
  presents :budget

  def display_amount
    number_to_currency(budget.amount)
  end

  def name
    "Budget de l'année #{budget.year}"
  end
end
