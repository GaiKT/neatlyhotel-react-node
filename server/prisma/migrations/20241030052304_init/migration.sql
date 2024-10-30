/*
  Warnings:

  - You are about to drop the column `roomAmenities` on the `RoomType` table. All the data in the column will be lost.
  - You are about to drop the column `roomSrice` on the `RoomType` table. All the data in the column will be lost.
  - You are about to drop the `Users` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `roomPrice` to the `RoomType` table without a default value. This is not possible if the table is not empty.
  - Added the required column `fullName` to the `UserProfile` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "BookingDetail" DROP CONSTRAINT "BookingDetail_userId_fkey";

-- DropForeignKey
ALTER TABLE "UserProfile" DROP CONSTRAINT "UserProfile_userId_fkey";

-- AlterTable
ALTER TABLE "BookingDetail" ALTER COLUMN "userId" SET DATA TYPE TEXT,
ALTER COLUMN "createdAt" SET DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "RoomType" DROP COLUMN "roomAmenities",
DROP COLUMN "roomSrice",
ADD COLUMN     "roomPrice" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "UserProfile" ADD COLUMN     "fullName" TEXT NOT NULL,
ALTER COLUMN "userId" SET DATA TYPE TEXT,
ALTER COLUMN "idNumber" SET DATA TYPE TEXT,
ALTER COLUMN "cardNumber" SET DATA TYPE TEXT;

-- DropTable
DROP TABLE "Users";

-- CreateTable
CREATE TABLE "User" (
    "userId" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "RoomAmenitie" (
    "roomAmenitieId" SERIAL NOT NULL,
    "roomAmenitieName" TEXT NOT NULL,
    "roomTypeId" INTEGER NOT NULL,

    CONSTRAINT "RoomAmenitie_pkey" PRIMARY KEY ("roomAmenitieId")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "UserProfile" ADD CONSTRAINT "UserProfile_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BookingDetail" ADD CONSTRAINT "BookingDetail_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoomAmenitie" ADD CONSTRAINT "RoomAmenitie_roomTypeId_fkey" FOREIGN KEY ("roomTypeId") REFERENCES "RoomType"("roomTypeId") ON DELETE RESTRICT ON UPDATE CASCADE;
