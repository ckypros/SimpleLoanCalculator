class Help {
  String title;
  String text;

  Help(this.title, this.text);

  Help.interestRate()
      : title = "Interest Rate",
        text =
            "Interest rates affect how much you will spend on each payment.  By decreasing the rate, you will be able to reduce your payment.  Your credit score is the biggest indication of how low of an interest rate you can expect.";

  Help.loanDuration()
      : title = "Length of Loan (in Months)",
        text =
            "The length of the loan determines how many payments the loan be split up across.  As you increase the number of payments, you will spend significantly more on interest.  Typically, longer duration loans have higher interest rates.";

  Help.downPayment()
      : title = "Down Payment + Trade-in",
        text =
            "By putting money down on the loan or providing a trade-in vehicle toward the loan, you can minimize the amount of interest paid and reduce your monthly payment to make it more manageable.";

  Help.cost()
      : title = "Cost of Vehicle",
        text =
            "It is important to consider additional costs when preparing to buy a vehicle.  A good rule of thumb is to add 10% to the price to account for taxes and fees.";

  Help.mortgageCost()
      : title = "House Price",
        text =
            "Houses are very expensive, and this will likely be the figure you end up manipulating the most when contemplating which house to buy.";

  Help.mortgageRate()
      : title = "Mortgage Interest Rate",
        text =
            "Mortgage rates are typically very low since are secured by your property if you do not pay your bill.  However, on a big purchase like this, the tiniest change in rate can drastically change the price";

  Help.mortgagePeriod()
      : title = "Mortgage Length of Loan",
        text =
        "Most mortgages are either 15 or 30 years.  Unless you have a lot of money, it is standard to take on a 30 year mortgage.";

  Help.mortgageDownPayment()
      : title = "Mortgage Down Payment",
        text =
        "First time home owner loans typically require a 3% down payment, while conventional loans require between 5% and 20% down payment.  The more you put down will lower your payment significantly.";

  Help.mortgageClosingCosts()
      : title = "Mortgage Closing Costs",
        text =
        "Closing costs typically cost between 3% to 10% of the home price.  If needed, the buyer can request the seller to pay the closing costs, but it might be a good idea to increase the offer price on the home if you asking for this.";

  Help.mortgagePropertyTax()
      : title = "Mortgage Property Tax",
        text =
        "Property tax must be annually as long as you own your home, and they typically range from 1% up to 3% of the houses appraised value.  This means as the house increases in value, your taxes can possibly increase each year.";


}
