#include <CustomLibraries/StrategyManagement/LogicalOp/or.mqh>
#include <CustomLibraries/StrategyManagement/LogicalOp/and.mqh>
#include <CustomLibraries/StrategyManagement/LogicalOp/not.mqh>
#include <CustomLibraries/StrategyManagement/BinaryRules/firstIndicatorBelowSecond.mqh>
#include <CustomLibraries/StrategyManagement/BinaryRules/crossUp.mqh>
#include <CustomLibraries/StrategyManagement/BinaryRules/crossDown.mqh>
#include <CustomLibraries/StrategyManagement/BinaryRules/firstIndicatorAboveSecond.mqh>
#include <CustomLibraries/StrategyManagement/UnaryRules/higherThanLine.mqh>
#include <CustomLibraries/StrategyManagement/UnaryRules/lowerThanLine.mqh>
#include <CustomLibraries/StrategyManagement/UnaryRules/inAbsoluteBoundary.mqh>


bool isBuyEntryRuleValid(
      double &fastMa[],
      double &slowMa[]) {
      
      bool result;
      
      Rule* maCrossUp = new CrossUp(fastMa, slowMa, 1, 1);
      Rule* ascendingFastMa = new FirstIndicatorAboveSecond(fastMa, fastMa, 1, 2);
      Rule* ascendingSlowMa = new FirstIndicatorAboveSecond(slowMa, slowMa, 1, 2);
      Rule* closeAboveFastMa = new LowerThanLine(fastMa, 1, iClose(s, p, 1));
      Rule* closeAboveSlowMa = new LowerThanLine(slowMa, 1, iClose(s, p, 1));
      Rule* a[] = {maCrossUp, ascendingFastMa, ascendingSlowMa, closeAboveFastMa, closeAboveSlowMa};
      Rule* entryRule = new And(a);
      
      result = entryRule.isValid();
      
      delete maCrossUp;
      delete ascendingFastMa;
      delete ascendingSlowMa;
      delete closeAboveFastMa;
      delete closeAboveSlowMa;
      delete entryRule;
      
      return result;
}

bool isBuyTakeProfitRuleValid(double tp) {
   bool result;
   double highs[] = {iHigh(s, p, 1)};
   Rule* priceAboveHighsPrice = new HigherThanLine(highs, 0, tp);
   result = priceAboveHighsPrice.isValid();
   delete priceAboveHighsPrice;   
   return result;
}

bool isBuyStopLossRuleValid(double stopLoss) {
   bool result;
   double lows[] = {iLow(s, p, 1)};
   Rule* slBuyRule = new LowerThanLine(lows, 0, stopLoss);
   result = slBuyRule.isValid();
   delete slBuyRule;
   return result;
}

bool isSellEntryRuleValid(
      double &fastMa[],
      double &slowMa[]) {
      
      bool result;
      
      Rule* maCrossDown = new CrossDown(fastMa, slowMa, 1, 1);
      Rule* descendingFastMa = new FirstIndicatorBelowSecond(fastMa, fastMa, 1, 2);
      Rule* descendingSlowMa = new FirstIndicatorBelowSecond(slowMa, slowMa, 1, 2);
      Rule* closeUnderFastMa = new HigherThanLine(fastMa, 1, iClose(s, p, 1));
      Rule* closeUnderSlowMa = new HigherThanLine(slowMa, 1, iClose(s, p, 1));
      Rule* a[] = {maCrossDown, descendingFastMa, descendingSlowMa, closeUnderFastMa, closeUnderSlowMa};
      Rule* entryRule = new And(a);
      
      result = entryRule.isValid();
      
      delete maCrossDown;
      delete descendingFastMa;
      delete descendingSlowMa;
      delete closeUnderFastMa;
      delete closeUnderSlowMa;
      delete entryRule;
      
      return result;
}

bool isSellTakeProfitRuleValid(double tp) {
   bool result;
   double lows[] = {iLow(s, p, 1)};
   Rule* priceLowerThanLine = new LowerThanLine(lows, 0, tp);
   result = priceLowerThanLine.isValid();
   delete priceLowerThanLine;   
   return result;
}

bool isSellStopLossRuleValid(double stopLoss) {
   bool result;
   double highs[] = {iHigh(s, p, 1)};
   Rule* slSellRule = new HigherThanLine(highs, 0, stopLoss);
   result = slSellRule.isValid();
   delete slSellRule;
   return result;
}