/obj/machinery/vending/autodrobe/Initialize()
	var/list/extra_products = list(
		/obj/item/clothing/suit/hooded/corpus = 1,
		/obj/item/clothing/suit/hooded/corpus/c = 1,
		/obj/item/clothing/under/vaultsuit = 3,
		/obj/item/clothing/neck/cloak/binary = 3,
		/obj/item/clothing/suit/maid = 3,
		/obj/item/clothing/suit/hooded/pyramidhead = 1,
		/obj/item/clothing/suit/baroness = 3,
		/obj/item/clothing/suit/baroness/ladyballat = 3,
		/obj/item/clothing/suit/flatwoods = 3
	)
	LAZYADD(products, extra_products)
	. = ..()

