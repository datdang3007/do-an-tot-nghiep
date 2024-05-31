import { Grid, styled, useTheme } from "@mui/material";
import { DataGrid, GridColDef } from "@mui/x-data-grid";
import { COLOR_PALLETTE } from "../../../../constants";
import { randomId } from "@mui/x-data-grid-generator";

export const CardSupplier = () => {
  const theme = useTheme();

  const columns: GridColDef<(typeof rows)[number]>[] = [
    {
      field: "name",
      headerName: "Loại hàng",
      width: 200,
      sortable: false,
      resizable: false,
    },
    {
      field: "extreme_small",
      headerName: "Rất nhỏ",
      type: "number",
      width: 125,
      sortable: false,
      resizable: false,
    },
    {
      field: "small",
      headerName: "Nhỏ",
      type: "number",
      width: 125,
      sortable: false,
      resizable: false,
    },
    {
      field: "medium",
      headerName: "Vừa",
      type: "number",
      width: 125,
      sortable: false,
      resizable: false,
    },
    {
      field: "large",
      headerName: "Lớn",
      type: "number",
      width: 125,
      sortable: false,
      resizable: false,
    },
    {
      field: "extreme_large",
      headerName: "Rất lớn",
      type: "number",
      width: 125,
      sortable: false,
      resizable: false,
    },
  ];

  const rows: any[] = [
    {
      id: randomId(),
      name: "Tạp hoá",
      extreme_small: 100,
      small: 200,
      medium: 300,
      large: 400,
      extreme_large: 500,
    },
    {
      id: randomId(),
      name: "Quần áo",
      extreme_small: 100,
      small: 200,
      medium: 300,
      large: 400,
      extreme_large: 500,
    },
    {
      id: randomId(),
      name: "Dụng cụ",
      extreme_small: 100,
      small: 200,
      medium: 300,
      large: 400,
      extreme_large: 500,
    },
  ];

  return (
    <CustomCard container rowGap={theme.spacing(16)}>
      <TableStyle container>
        <DataGrid
          rows={rows}
          columns={columns}
          hideFooter
          disableColumnMenu
          disableColumnFilter
          disableColumnSelector
        />
      </TableStyle>
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
