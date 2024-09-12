/*
  Warnings:

  - You are about to drop the column `priceInCents` on the `Order` table. All the data in the column will be lost.
  - Added the required column `pricePaidInCents` to the `Order` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Order" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "pricePaidInCents" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "userId" TEXT NOT NULL,
    "ProductId" TEXT NOT NULL,
    CONSTRAINT "Order_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "Order_ProductId_fkey" FOREIGN KEY ("ProductId") REFERENCES "Product" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Order" ("ProductId", "createdAt", "id", "updatedAt", "userId") SELECT "ProductId", "createdAt", "id", "updatedAt", "userId" FROM "Order";
DROP TABLE "Order";
ALTER TABLE "new_Order" RENAME TO "Order";
CREATE UNIQUE INDEX "Order_userId_key" ON "Order"("userId");
CREATE UNIQUE INDEX "Order_ProductId_key" ON "Order"("ProductId");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
