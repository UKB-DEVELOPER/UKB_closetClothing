Queries = {}

Queries.getCloset = function(player)
    
    local closetQuery = MySQL.query.await('SELECT * FROM `a_save_clouth` WHERE `identifier` = ?', {
        player.identifier
    })

    return closetQuery or nil
end