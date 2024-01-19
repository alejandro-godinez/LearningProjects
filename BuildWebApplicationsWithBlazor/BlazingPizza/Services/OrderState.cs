namespace BlazingPizza.Services;

public class OrderState
{
    public bool ShowingConfigureDialog { get; private set; }
    public Pizza ConfiguringPizza { get; private set; }
    public Order Order { get; private set; } = new Order();

    public void ShowConfigurePizzaDialog(PizzaSpecial special)
    {
        //initialize new configuring pizza object
        ConfiguringPizza = new Pizza()
        {
            Special = special,
            SpecialId = special.Id,
            Size = Pizza.DefaultSize,
            Toppings = new List<PizzaTopping>(),
        };

        //show the configure dialog
        ShowingConfigureDialog = true;
    }

    public void CancelConfigurePizzaDialog()
    {
        //clear current configuring pizza
        ConfiguringPizza = null;

        //close configure dialog
        ShowingConfigureDialog = false;
    }

    public void ConfirmConfigurePizzaDialog()
    {
        //add configured pizza to order pizza list
        Order.Pizzas.Add(ConfiguringPizza);

        //clear current configuring pizza
        ConfiguringPizza = null;

        //close configure dialog
        ShowingConfigureDialog = false;
    }
    public void RemoveConfiguredPizza(Pizza pizza)
    {
        Order.Pizzas.Remove(pizza);
    }

    public void ResetOrder()
    {
        Order = new Order();
    }
}