import { defineConfig } from 'vite';
import { viteSingleFile } from 'vite-plugin-singlefile';

// Vite config สำหรับ Analyst's Notebook v3
// เป้าหมาย: build เป็น HTML เดียวที่เปิดบน file:// ได้ใน Chrome/Edge บน Windows
// build-and-deploy.cjs จะ post-process ลบ type="module" ต่อหลัง vite build
//
// v3.1: PapaParse / SheetJS ใช้ `import.meta.url` ภายในตัวเอง — ต้อง replace
// ตอน build เพราะ post-process strip type="module" ทำให้ `import.meta` พังตอน
// runtime หากปล่อยทิ้งไว้. ป้องกัน 2 ชั้น: define ตอน build + regex replace
// ในไฟล์ final HTML (build-and-deploy.cjs).

export default defineConfig({
  plugins: [
    viteSingleFile({
      useRecommendedBuildConfig: true,
      removeViteModuleLoader: true,
    }),
  ],
  define: {
    // แทน import.meta.url ด้วย string ว่างขณะ build — ไลบรารีที่ใช้ค่านี้
    // (XLSX, PapaParse) จะ fallback ไป path อื่นที่ไม่ใช้ module context
    'import.meta.url': JSON.stringify(''),
  },
  build: {
    target: 'es2019',
    cssCodeSplit: false,
    assetsInlineLimit: 100_000_000, // inline ทุก asset เป็น data-uri
    chunkSizeWarningLimit: 5000,    // เตือนเมื่อเกิน 5MB (per CLAUDE.md)
    rollupOptions: {
      output: {
        inlineDynamicImports: true,
      },
    },
  },
});
