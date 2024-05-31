import { Grid, Typography, styled, useTheme } from "@mui/material";
import { useMemo } from "react";
import Rebel2Img from "../../../../assets/rebel2.webp";
import GuardianImg from "../../../../assets/guardian.webp";
import Sandking2Img from "../../../../assets/sandking2.webp";
import Mule4Img from "../../../../assets/mule4.webp";
import Pounder2Img from "../../../../assets/pounder2.webp";
import Hauler2Img from "../../../../assets/hauler2.webp";
import Phantom3Img from "../../../../assets/phantom3.webp";
import { ITruckerVehicle } from "../../../../interfaces";
import { CardVehicle } from "./CardVehicle";
import { COLOR_PALLETTE } from "../../../../constants";

const listTruckerVehicle: ITruckerVehicle[] = [
  {
    model: "rebel2",
    rent: 1000,
    price: 50000,
    image: Rebel2Img,
    name: "Rebel",
    level: 1,
    speed: "87",
    trunkSpace: 2,
    listCargo: ["Nhỏ"],
  },
  {
    model: "sandking2",
    rent: 2500,
    price: 125000,
    image: Sandking2Img,
    name: "Sandking",
    level: 2,
    speed: "89",
    trunkSpace: 4,
    listCargo: ["Nhỏ", "vừa"],
  },
  {
    model: "guardian",
    rent: 5000,
    price: 275000,
    image: GuardianImg,
    name: "Guardian",
    level: 3,
    speed: "91",
    trunkSpace: 5,
    listCargo: ["Nhỏ", "vừa", "trung"],
  },
  {
    model: "mule4",
    rent: 8000,
    price: 500000,
    image: Mule4Img,
    name: "Mule",
    level: 4,
    speed: "67",
    trunkSpace: 24,
    listCargo: ["Nhỏ", "vừa", "trung", "lớn"],
  },
  {
    model: "pounder2",
    rent: 12000,
    price: 800000,
    image: Pounder2Img,
    name: "Pounder",
    level: 4,
    speed: "67",
    trunkSpace: 36,
    listCargo: ["Nhỏ", "vừa", "trung", "lớn", "rất lớn"],
  },
  {
    model: "hauler2",
    rent: 1000,
    price: 1000000,
    image: Hauler2Img,
    name: "Hauler",
    level: 5,
    speed: "67",
    trunkSpace: 1,
    listCargo: ["container"],
  },
  {
    model: "phantom3",
    rent: 1000,
    price: 1200000,
    image: Phantom3Img,
    name: "Phantom",
    level: 6,
    speed: "67",
    trunkSpace: 1,
    listCargo: ["container"],
  },
];

export const Vehicles = () => {
  const theme = useTheme();

  const renderCardsVehicleComponent = useMemo(() => {
    return listTruckerVehicle.map((vehicle) => {
      return <CardVehicle key={vehicle.model} vehicle={vehicle} />;
    });
  }, []);

  return (
    <Grid container rowGap={theme.spacing(16)} height={1}>
      {/* Title */}
      <Grid container>
        <TypographyStyle fontSize={theme.spacing(22)} fontWeight="bold">
          Danh sách phương tiện
        </TypographyStyle>
      </Grid>

      {/* List */}
      <ListVehicleStyle container>
        <Grid container rowGap={theme.spacing(12)}>
          {renderCardsVehicleComponent}
        </Grid>
      </ListVehicleStyle>
    </Grid>
  );
};

const TypographyStyle = styled(Typography)({
  color: "#FFFFFF",
});

const ListVehicleStyle = styled(Grid)(({ theme }) => ({
  overflowY: "auto",
  paddingRight: theme.spacing(10),
  height: `calc(100% - ${theme.spacing(54)})`,
  "&::-webkit-scrollbar": {
    width: theme.spacing(8),
  },
  "&::-webkit-scrollbar-track": {
    borderRadius: theme.spacing(4),
    background: COLOR_PALLETTE.GRAY_800,
  },
  "&::-webkit-scrollbar-thumb": {
    borderRadius: theme.spacing(4),
    background: COLOR_PALLETTE.GRAY_700,
  },
  "&::-webkit-scrollbar-thumb:hover": {
    background: "#FFFFFF",
  },
}));
