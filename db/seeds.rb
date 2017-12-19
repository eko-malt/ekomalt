BagInput.delete_all
GrainInput.delete_all
Provider.destroy_all

Provider.create(name: 'Google', gtype: 1)
Provider.create(name: 'Facebook', gtype: 1)
Provider.create(name: 'Twitter', gtype: 1)
Provider.create(name: 'LinkedIn', gtype: 1)
Provider.create(name: 'Instagram', gtype: 1)

Provider.create(name: 'Alibaba', gtype: 2)
Provider.create(name: 'Ebay', gtype: 2)
Provider.create(name: 'OLX', gtype: 2)
Provider.create(name: 'Amazon', gtype: 2)
Provider.create(name: 'Gorishni plavni', gtype: 2)


Equipment.destroy_all
Equipment.create(eqtype: 1, name: 'Замочний чан 1', maltose: 1, capacity: 10, service_time: 4, status: 1)
Equipment.create(eqtype: 1, name: 'Замочний чан 2', maltose: 1, capacity: 10, service_time: 4, status: 1)
Equipment.create(eqtype: 1, name: 'Замочний чан 3', maltose: 1, capacity: 10, service_time: 4, status: 1)
Equipment.create(eqtype: 1, name: 'Замочний чан 1', maltose: 2, capacity: 10, service_time: 4, status: 1)
Equipment.create(eqtype: 1, name: 'Замочний чан 2', maltose: 2, capacity: 10, service_time: 4, status: 1)
Equipment.create(eqtype: 2, name: 'Тік 1', maltose: 1, capacity: 10, service_time: 4, status: 1)
Equipment.create(eqtype: 2, name: 'Тік 2', maltose: 1, capacity: 10, service_time: 4, status: 1)
Equipment.create(eqtype: 2, name: 'Тік 3', maltose: 1, capacity: 10, service_time: 4, status: 1)
Equipment.create(eqtype: 2, name: 'Тік 4', maltose: 1, capacity: 10, service_time: 4, status: 1)
Equipment.create(eqtype: 2, name: 'Тік 5', maltose: 1, capacity: 10, service_time: 4, status: 1)
Equipment.create(eqtype: 2, name: 'Тік 1', maltose: 2, capacity: 10, service_time: 4, status: 1)
Equipment.create(eqtype: 2, name: 'Тік 2', maltose: 2, capacity: 10, service_time: 4, status: 1)
Equipment.create(eqtype: 2, name: 'Тік 3', maltose: 2, capacity: 10, service_time: 4, status: 1)
Equipment.create(eqtype: 3, name: 'Ферментер 1', maltose: 1, capacity: 10, service_time: 4, status: 1)
Equipment.create(eqtype: 3, name: 'Ферментер 1', maltose: 2, capacity: 10, service_time: 4, status: 1)
Equipment.create(eqtype: 3, name: 'Ферментер 2', maltose: 2, capacity: 10, service_time: 4, status: 1)
Equipment.create(eqtype: 3, name: 'Ферментер 3', maltose: 2, capacity: 10, service_time: 4, status: 1)
Equipment.create(eqtype: 4, name: 'Сушка', maltose: 1, capacity: 10, service_time: 4, status: 1)
Equipment.create(eqtype: 4, name: 'Сушка', maltose: 2, capacity: 10, service_time: 4, status: 1)

Malt.delete_all
Malt.create(name: 'white', color: 'ffffff')
Malt.create(name: 'fermented', color: 'a1887f')
Malt.create(name: 'very_fermented', color: '5d4037')
Malt.create(name: 'extra', color: '000000')