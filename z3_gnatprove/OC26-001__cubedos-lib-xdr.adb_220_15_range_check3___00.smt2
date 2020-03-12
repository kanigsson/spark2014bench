(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun div1 (Int Int) Int)

(declare-fun mod1 (Int Int) Int)

;; Div_mod
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (= x (+ (* y (div1 x y)) (mod1 x y))))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div1 x y)) (<= (div1 x y) x)))))

;; Mod_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0))
  (and (< (- (abs1 y)) (mod1 x y)) (< (mod1 x y) (abs1 y))))))

;; Div_sign_pos
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< 0 y)) (<= 0 (div1 x y)))))

;; Div_sign_neg
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= x 0) (< 0 y)) (<= (div1 x y) 0))))

;; Mod_sign_pos
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (not (= y 0))) (<= 0 (mod1 x y)))))

;; Mod_sign_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= x 0) (not (= y 0))) (<= (mod1 x y) 0))))

;; Rounds_toward_zero
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (<= (abs1 (* (div1 x y) y)) (abs1 x)))))

;; Div_1
  (assert (forall ((x Int)) (= (div1 x 1) x)))

;; Mod_1
  (assert (forall ((x Int)) (= (mod1 x 1) 0)))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div1 x y) 0))))

;; Mod_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (mod1 x y) x))))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (div1 (+ (* x y) z) x) (+ y (div1 z x)))) :pattern ((div1
                                                            (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (mod1 (+ (* x y) z) x) (mod1 z x))) :pattern ((mod1 (+ (* x y) z) x)) )))

(define-fun mod2 ((x Int)
  (y Int)) Int (ite (< 0 y) (mod x y) (+ (mod x y) y)))

(declare-fun nth ((_ BitVec 8) Int) Bool)

(declare-fun lsr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun asr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun lsl ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_right1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_left1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 8))) Int (ite (bvsge x (_ bv0 8))
                                           (bv2int x) (- (- 256 (bv2int x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 255)))

(declare-fun nth_bv ((_ BitVec 8) (_ BitVec 8)) Bool)

(declare-fun eq_sub_bv ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

(define-fun eq_sub ((a (_ BitVec 8)) (b (_ BitVec 8)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content (_ BitVec 8))))))
(declare-fun power ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun bv_min ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) y x))

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

(declare-fun nth1 ((_ BitVec 64) Int) Bool)

(declare-fun lsr1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun asr1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun lsl1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun rotate_right2 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun rotate_left2 ((_ BitVec 64) Int) (_ BitVec 64))

(define-fun to_int2 ((x (_ BitVec 64))) Int (ite (bvsge x (_ bv0 64))
                                            (bv2int x)
                                            (- (- 18446744073709551616 (bv2int x)))))

(define-fun uint_in_range1 ((i Int)) Bool (and (<= 0 i)
                                          (<= i 18446744073709551615)))

(declare-fun nth_bv1 ((_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun eq_sub_bv1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)
  (_ BitVec 64)) Bool)

(define-fun eq_sub1 ((a (_ BitVec 64)) (b (_ BitVec 64)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth1 a j) (nth1 b j)))))

(declare-datatypes () ((t__ref1 (t__refqtmk1 (t__content1 (_ BitVec 64))))))
(declare-fun power1 ((_ BitVec 64) Int) (_ BitVec 64))

(define-fun bv_min1 ((x (_ BitVec 64))
  (y (_ BitVec 64))) (_ BitVec 64) (ite (bvule x y) x y))

(define-fun bv_max1 ((x (_ BitVec 64))
  (y (_ BitVec 64))) (_ BitVec 64) (ite (bvule x y) y x))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort octet 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 8))

(declare-fun user_eq1 (octet octet) Bool)

(declare-const dummy1 octet)

(declare-datatypes () ((octet__ref (octet__refqtmk (octet__content octet)))))
(define-fun octet__ref_octet__content__projection ((a octet__ref)) octet 
  (octet__content a))

(declare-sort octet_array_index 0)

(declare-fun octet_array_indexqtint (octet_array_index) Int)

;; octet_array_index'axiom
  (assert
  (forall ((i octet_array_index))
  (and (<= 0 (octet_array_indexqtint i))
  (<= (octet_array_indexqtint i) 65535))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 65535)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (octet_array_index octet_array_index) Bool)

(declare-const dummy2 octet_array_index)

(declare-datatypes ()
((octet_array_index__ref
 (octet_array_index__refqtmk (octet_array_index__content octet_array_index)))))
(define-fun octet_array_index__ref_octet_array_index__content__projection ((a octet_array_index__ref)) octet_array_index 
  (octet_array_index__content a))

(declare-fun to_rep1 (octet) (_ BitVec 8))

(declare-fun of_rep1 ((_ BitVec 8)) octet)

;; inversion_axiom
  (assert
  (forall ((x octet))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep1 (of_rep1 x)) x) :pattern ((to_rep1 (of_rep1 x))) )))

(define-fun to_int3 ((x octet)) Int (bv2int (to_rep1 x)))

;; range_int_axiom
  (assert
  (forall ((x octet)) (! (uint_in_range
  (to_int3 x)) :pattern ((to_int3 x)) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int octet))))))
(declare-fun slide ((Array Int octet) Int Int) (Array Int octet))

;; slide_eq
  (assert
  (forall ((a (Array Int octet)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int octet)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int octet)) (a__first Int) (a__last Int)
  (b (Array Int octet)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int octet)) (b (Array Int octet)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int octet))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int octet) (elts a))

(define-fun of_array ((a (Array Int octet)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ()
((octet_array__ref (octet_array__refqtmk (octet_array__content us_t)))))
(define-fun octet_array__ref_octet_array__content__projection ((a octet_array__ref)) us_t 
  (octet_array__content a))

(declare-const data us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const position Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-sort xdr_unsigned_hyper 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 64))

(declare-fun attr__ATTRIBUTE_IMAGE4 ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) (_ BitVec 64))

(declare-fun user_eq4 (xdr_unsigned_hyper xdr_unsigned_hyper) Bool)

(declare-const dummy4 xdr_unsigned_hyper)

(declare-datatypes ()
((xdr_unsigned_hyper__ref
 (xdr_unsigned_hyper__refqtmk
 (xdr_unsigned_hyper__content xdr_unsigned_hyper)))))
(define-fun xdr_unsigned_hyper__ref_xdr_unsigned_hyper__content__projection ((a xdr_unsigned_hyper__ref)) xdr_unsigned_hyper 
  (xdr_unsigned_hyper__content a))

(define-fun dynamic_invariant ((temp___expr_192 (_ BitVec 64))
  (temp___is_init_188 Bool) (temp___skip_constant_189 Bool)
  (temp___do_toplevel_190 Bool) (temp___do_typ_inv_191 Bool)) Bool true)

(define-fun dynamic_invariant1 ((temp___expr_206 Int)
  (temp___is_init_202 Bool) (temp___skip_constant_203 Bool)
  (temp___do_toplevel_204 Bool)
  (temp___do_typ_inv_205 Bool)) Bool (=>
                                     (or (= temp___is_init_202 true)
                                     (<= 0 65535)) (in_range2
                                     temp___expr_206)))

(define-fun dynamic_invariant2 ((temp___expr_227 us_t)
  (temp___is_init_223 Bool) (temp___skip_constant_224 Bool)
  (temp___do_toplevel_225 Bool)
  (temp___do_typ_inv_226 Bool)) Bool (=>
                                     (not (= temp___skip_constant_224 true))
                                     (dynamic_property 0 65535
                                     (first1 temp___expr_227)
                                     (last1 temp___expr_227))))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant4 ((temp___expr_199 (_ BitVec 8))
  (temp___is_init_195 Bool) (temp___skip_constant_196 Bool)
  (temp___do_toplevel_197 Bool) (temp___do_typ_inv_198 Bool)) Bool true)

(declare-const value (_ BitVec 64))

(declare-const last2 Int)

(declare-const temporary_2 (_ BitVec 64))

;; Assume
  (assert (dynamic_invariant2 data true false true true))

;; Assume
  (assert (dynamic_invariant1 position true false true true))

;; Assume
  (assert (dynamic_invariant value false false true true))

;; Assume
  (assert (dynamic_invariant1 last2 false false true true))

;; Assume
  (assert
  (and
  (and (and (= (mod1 position 4) 0) (= (mod1 (length data) 4) 0))
  (and (<= (first1 data) position) (<= position (last1 data))))
  (<= (+ position 7) (last1 data))))

;; Assert
  (assert (and (<= (first1 data) position) (<= position (last1 data))))

(declare-const o (_ BitVec 8))

;; Ensures
  (assert (= (to_rep1 (select (to_array data) position)) o))

(declare-const temporary_1 (_ BitVec 64))

;; H
  (assert (= temporary_1 ((_ zero_extend 56) o)))

;; Assume
  (assert (dynamic_invariant temporary_1 true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant temporary_2 false false true true))

(declare-const i Int)

;; H
  (assert (= i 1))

(declare-const temporary_21 (_ BitVec 64))

;; H
  (assert (= temporary_21 (bvmul temporary_1 #x0000000000000100)))

(define-fun temp___606 () Int (+ position i))

;; Assert
  (assert (and (<= (first1 data) temp___606) (<= temp___606 (last1 data))))

(declare-const o1 (_ BitVec 8))

;; Ensures
  (assert (= (to_rep1 (select (to_array data) temp___606)) o1))

(declare-const temporary_22 (_ BitVec 64))

;; H
  (assert (= temporary_22 (bvadd temporary_21 ((_ zero_extend 56) o1))))

(declare-const value1 (_ BitVec 64))

;; H
  (assert (= value1 temporary_22))

(declare-const temporary_11 (_ BitVec 64))

;; H
  (assert (= temporary_11 value1))

(declare-const i1 Int)

;; H
  (assert (= i1 2))

(declare-const temporary_23 (_ BitVec 64))

;; H
  (assert (= temporary_23 (bvmul temporary_11 #x0000000000000100)))

(define-fun temp___6061 () Int (+ position i1))

;; Assert
  (assert (and (<= (first1 data) temp___6061) (<= temp___6061 (last1 data))))

(declare-const o2 (_ BitVec 8))

;; Ensures
  (assert (= (to_rep1 (select (to_array data) temp___6061)) o2))

(declare-const temporary_24 (_ BitVec 64))

;; H
  (assert (= temporary_24 (bvadd temporary_23 ((_ zero_extend 56) o2))))

(declare-const value2 (_ BitVec 64))

;; H
  (assert (= value2 temporary_24))

(declare-const temporary_12 (_ BitVec 64))

;; H
  (assert (= temporary_12 value2))

(declare-const i2 Int)

;; H
  (assert (= i2 3))

(declare-const temporary_25 (_ BitVec 64))

;; H
  (assert (= temporary_25 (bvmul temporary_12 #x0000000000000100)))

(define-fun temp___6062 () Int (+ position i2))

;; Assert
  (assert (and (<= (first1 data) temp___6062) (<= temp___6062 (last1 data))))

(declare-const o3 (_ BitVec 8))

;; Ensures
  (assert (= (to_rep1 (select (to_array data) temp___6062)) o3))

(declare-const temporary_26 (_ BitVec 64))

;; H
  (assert (= temporary_26 (bvadd temporary_25 ((_ zero_extend 56) o3))))

(declare-const value3 (_ BitVec 64))

;; H
  (assert (= value3 temporary_26))

(declare-const temporary_13 (_ BitVec 64))

;; H
  (assert (= temporary_13 value3))

(declare-const i3 Int)

;; H
  (assert (= i3 4))

(declare-const temporary_27 (_ BitVec 64))

;; H
  (assert (= temporary_27 (bvmul temporary_13 #x0000000000000100)))

(define-fun temp___6063 () Int (+ position i3))

;; Assert
  (assert (and (<= (first1 data) temp___6063) (<= temp___6063 (last1 data))))

(declare-const o4 (_ BitVec 8))

;; Ensures
  (assert (= (to_rep1 (select (to_array data) temp___6063)) o4))

(declare-const temporary_28 (_ BitVec 64))

;; H
  (assert (= temporary_28 (bvadd temporary_27 ((_ zero_extend 56) o4))))

(declare-const value4 (_ BitVec 64))

;; H
  (assert (= value4 temporary_28))

(declare-const temporary_14 (_ BitVec 64))

;; H
  (assert (= temporary_14 value4))

(declare-const i4 Int)

;; H
  (assert (= i4 5))

(declare-const temporary_29 (_ BitVec 64))

;; H
  (assert (= temporary_29 (bvmul temporary_14 #x0000000000000100)))

(define-fun temp___6064 () Int (+ position i4))

;; Assert
  (assert (and (<= (first1 data) temp___6064) (<= temp___6064 (last1 data))))

(declare-const o5 (_ BitVec 8))

;; Ensures
  (assert (= (to_rep1 (select (to_array data) temp___6064)) o5))

(declare-const temporary_210 (_ BitVec 64))

;; H
  (assert (= temporary_210 (bvadd temporary_29 ((_ zero_extend 56) o5))))

(declare-const value5 (_ BitVec 64))

;; H
  (assert (= value5 temporary_210))

(declare-const temporary_15 (_ BitVec 64))

;; H
  (assert (= temporary_15 value5))

(declare-const i5 Int)

;; H
  (assert (= i5 6))

(declare-const temporary_211 (_ BitVec 64))

;; H
  (assert (= temporary_211 (bvmul temporary_15 #x0000000000000100)))

(define-fun temp___6065 () Int (+ position i5))

;; Assert
  (assert (and (<= (first1 data) temp___6065) (<= temp___6065 (last1 data))))

(declare-const o6 (_ BitVec 8))

;; Ensures
  (assert (= (to_rep1 (select (to_array data) temp___6065)) o6))

(declare-const temporary_212 (_ BitVec 64))

;; H
  (assert (= temporary_212 (bvadd temporary_211 ((_ zero_extend 56) o6))))

(declare-const value6 (_ BitVec 64))

;; H
  (assert (= value6 temporary_212))

(declare-const temporary_16 (_ BitVec 64))

;; H
  (assert (= temporary_16 value6))

(declare-const i6 Int)

;; H
  (assert (= i6 7))

(declare-const temporary_213 (_ BitVec 64))

;; H
  (assert (= temporary_213 (bvmul temporary_16 #x0000000000000100)))

(define-fun temp___6066 () Int (+ position i6))

;; Assert
  (assert (and (<= (first1 data) temp___6066) (<= temp___6066 (last1 data))))

(declare-const o7 (_ BitVec 8))

;; Ensures
  (assert (= (to_rep1 (select (to_array data) temp___6066)) o7))

(declare-const temporary_214 (_ BitVec 64))

;; H
  (assert (= temporary_214 (bvadd temporary_213 ((_ zero_extend 56) o7))))

(declare-const value7 (_ BitVec 64))

;; H
  (assert (= value7 temporary_214))

(define-fun o8 () Int (+ position 7))

(assert
;; defqtvc
 ;; File "cubedos-lib-xdr.ads", line 242, characters 0-0
  (not (in_range2 o8)))
(check-sat)
