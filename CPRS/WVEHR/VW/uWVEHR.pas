unit uWVEHR;

interface

procedure Show508Message(aMessage: String);

var
  // agp wv begin change
  hidePtSSN: boolean = false;
  // ag wv end change

const
//AA copy from uConst.pas
  NF_ERX_REFILL_NEEDED             = 11305;   //ERx 4/22/11
  NF_ERX_INCOMPLETE_ORDER          = 11306;   //ERx 4/22/11

  ERX_ACTION_ORDER = 0;
  ERX_ACTION_ALERT = 1;

implementation
uses
  Vcl.Dialogs;

//AA
procedure Show508Message(aMessage: String);
begin
  ShowMessage(aMessage);
end;


end.
