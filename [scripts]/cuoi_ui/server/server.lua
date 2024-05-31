function IsJobAvailable(job)
  local jobs = ESX.GetJobs()
  local JobToCheck = jobs[job]
  return not JobToCheck.whitelisted
end

RegisterServerEvent('cuoi-ui:menu-job:selectJob')
AddEventHandler('cuoi-ui:menu-job:selectJob', function(job)
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer and IsJobAvailable(job) then
    if ESX.DoesJobExist(job, 0) then
      xPlayer.setJob(job, 0)
    else
      print("[^1ERROR^7] Tried Setting User ^5".. source .. "^7 To Invalid Job - ^5"..job .."^7!")
    end
  else 
    print("[^3WARNING^7] User ^5".. source .. "^7 Attempted to Exploit ^5`esx_joblisting:setJob`^7!")
  end
end)