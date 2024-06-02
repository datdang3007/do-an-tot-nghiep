import { Navigation } from "@mui/icons-material";
import { Grid, styled, useTheme } from "@mui/material";
import { DataGrid, GridColDef } from "@mui/x-data-grid";
import { ButtonCommon } from "../../../../components";
import { COLOR_PALLETTE } from "../../../../constants";

type Props = {
  data: any[];
  onClickSetWaypoint: () => void;
};

export const CardSupplier = (props: Props) => {
  const theme = useTheme();
  const { data, onClickSetWaypoint } = props;

  const columns: GridColDef<(typeof data)[number]>[] = [
    {
      field: "name",
      headerName: "Loại hàng",
      width: 200,
      align: "center",
      sortable: false,
      resizable: false,
    },
    {
      field: "prop_cs_rub_box_02",
      headerName: "Rất nhỏ",
      width: 125,
      align: "center",
      sortable: false,
      resizable: false,
    },
    {
      field: "prop_cardbordbox_04a",
      headerName: "Nhỏ",
      width: 125,
      align: "center",
      sortable: false,
      resizable: false,
    },
    {
      field: "prop_box_wood05a",
      headerName: "Vừa",
      width: 125,
      align: "center",
      sortable: false,
      resizable: false,
    },
    {
      field: "prop_box_wood04a",
      headerName: "Lớn",
      width: 125,
      align: "center",
      sortable: false,
      resizable: false,
    },
    {
      field: "prop_box_wood08a",
      headerName: "Rất lớn",
      width: 125,
      align: "center",
      sortable: false,
      resizable: false,
    },
  ];

  return (
    <CustomCard container rowGap={theme.spacing(16)}>
      <TableStyle container>
        <DataGrid
          rows={data}
          columns={columns}
          hideFooter
          disableColumnMenu
          disableColumnFilter
          disableColumnSelector
        />
      </TableStyle>

      <Grid container justifyContent="flex-end">
        <ButtonCommon
          text="Chỉ đường"
          buttonProps={{
            color: "primary",
            variant: "contained",
            startIcon: <Navigation />,
            onClick: onClickSetWaypoint,
          }}
        />
      </Grid>
    </CustomCard>
  );
};

const CustomCard = styled(Grid)(({ theme }) => ({
  padding: theme.spacing(12),
  borderRadius: theme.spacing(8),
  background: COLOR_PALLETTE.GRAY_800,
}));

const TableStyle = styled(Grid)({
  ".MuiDataGrid-columnHeader": {
    color: "#FFFFFF",
  },
  ".MuiDataGrid-cellContent": {
    color: "#FFFFFF",
  },
  ".MuiDataGrid-columnSeparator": {
    display: "none !important",
  },
  ".MuiDataGrid-row": {
    backgroundColor: "transparent !important",
  },
  ".MuiDataGrid-columnHeaderTitleContainer": {
    justifyContent: "center",
  },
  ".MuiDataGrid-cell": {
    outline: "none !important",
    justifyContent: "center",
  },
});
