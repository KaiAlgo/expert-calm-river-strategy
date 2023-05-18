input double rRRatioInput = 1.5; // risk to reward ratio

input double pipInValueInput = 1;
input double riskInPercentInput = 1;

input int fastEmaLength = 20;
input ENUM_MA_METHOD fastEmaMode = MODE_EMA;
input ENUM_APPLIED_PRICE fastEmaSource = PRICE_CLOSE;

input int slowEmaLength = 50;
input ENUM_MA_METHOD slowEmaMode = MODE_EMA;
input ENUM_APPLIED_PRICE slowEmaSource = PRICE_CLOSE;


input double sATRMultiplier = 1.7;