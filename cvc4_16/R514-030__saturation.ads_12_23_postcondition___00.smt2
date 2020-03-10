(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-fun nth ((_ BitVec 16) Int) Bool)

(declare-fun lsr ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun asr ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun lsl ((_ BitVec 16) Int) (_ BitVec 16))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

;; Div_unique
  (assert
  (forall ((x Int) (y Int) (q Int))
  (=> (< 0 y) (=> (and (<= (* q y) x) (< x (+ (* q y) y))) (= (div x y) q)))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div x y)) (<= (div x y) x)))))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div x y) 0))))

;; Div_inf_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (< 0 x) (<= x y)) (= (div (- x) y) (- 1)))))

;; Mod_0
  (assert (forall ((y Int)) (=> (not (= y 0)) (= (mod 0 y) 0))))

;; Div_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div 1 y) 0))))

;; Div_minus1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div (- 1) y) (- 1)))))

;; Mod_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (mod 1 y) 1))))

;; Mod_minus1_left
  (assert
  (forall ((y Int))
  (! (=> (< 1 y) (= (mod (- 1) y) (- y 1))) :pattern ((mod (- 1) y)) )))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (div (+ (* x y) z) x) (+ y (div z x)))) :pattern ((div (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (mod (+ (* x y) z) x) (mod z x))) :pattern ((mod (+ (* x y) z) x)) )))

(declare-fun rotate_right1 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun rotate_left1 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 16))) Int (ite (bvsge x (_ bv0 16))
                                            (bv2nat x)
                                            (- (- 65536 (bv2nat x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 65535)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvor (bvshl v (bvurem n (_ bv16 16))) (bvlshr v (bvsub (_ bv16 16) (bvurem n (_ bv16 16))))) 
  (rotate_left1 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvor (bvlshr v (bvurem n (_ bv16 16))) (bvshl v (bvsub (_ bv16 16) (bvurem n (_ bv16 16))))) 
  (rotate_right1 v (bv2nat n)))))

(declare-fun nth_bv ((_ BitVec 16) (_ BitVec 16)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 16)) (i (_ BitVec 16)))
  (= (= (nth_bv x i) true) (not (= (bvand (bvlshr x i) #x0001) #x0000)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 16)) (i (_ BitVec 16)))
  (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 16)) (i Int))
  (=> (and (<= 0 i) (< i 65536)) (= (nth_bv x ((_ int2bv 16) i)) (nth x i)))))

(declare-fun eq_sub_bv ((_ BitVec 16) (_ BitVec 16) (_ BitVec 16)
  (_ BitVec 16)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 16)) (b (_ BitVec 16)) (i (_ BitVec 16))
  (n (_ BitVec 16)))
  (let ((mask (bvshl (bvsub (bvshl #x0001 n) #x0001) i)))
  (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub ((a (_ BitVec 16)) (b (_ BitVec 16)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 16)) (b (_ BitVec 16)) (i (_ BitVec 16))
  (n (_ BitVec 16)))
  (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content (_ BitVec 16))))))
(declare-fun power ((_ BitVec 16) Int) (_ BitVec 16))

(define-fun bv_min ((x (_ BitVec 16))
  (y (_ BitVec 16))) (_ BitVec 16) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 16))
  (y (_ BitVec 16))) (_ BitVec 16) (ite (bvule x y) y x))

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

(declare-sort unsigned_16 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 16))

(declare-fun attr__ATTRIBUTE_IMAGE ((_ BitVec 16)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) (_ BitVec 16))

(declare-fun user_eq (unsigned_16 unsigned_16) Bool)

(declare-const dummy unsigned_16)

(declare-datatypes ((unsigned_16__ref 0))
(((unsigned_16__refqtmk (unsigned_16__content unsigned_16)))))
(define-fun unsigned_16__ref_unsigned_16__content__projection ((a unsigned_16__ref)) unsigned_16 
  (unsigned_16__content a))

(declare-fun to_rep (unsigned_16) (_ BitVec 16))

(declare-fun of_rep ((_ BitVec 16)) unsigned_16)

;; inversion_axiom
  (assert
  (forall ((x unsigned_16))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 16)))
  (! (= (to_rep (of_rep x)) x) :pattern ((to_rep (of_rep x))) )))

(define-fun to_int2 ((x unsigned_16)) Int (bv2nat (to_rep x)))

;; range_int_axiom
  (assert
  (forall ((x unsigned_16)) (! (uint_in_range
  (to_int2 x)) :pattern ((to_int2 x)) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__saturation__saturable_value__value unsigned_16)(rec__saturation__saturable_value__upper_bound unsigned_16)))))
(define-fun us_split_fields_rec__saturation__saturable_value__value__projection ((a us_split_fields)) unsigned_16 
  (rec__saturation__saturable_value__value a))

(define-fun us_split_fields_rec__saturation__saturable_value__upper_bound__projection ((a us_split_fields)) unsigned_16 
  (rec__saturation__saturable_value__upper_bound a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__saturation__saturable_value__value
                           (us_split_fields1 a))) (to_rep
                                                  (rec__saturation__saturable_value__value
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__saturation__saturable_value__upper_bound
                           (us_split_fields1 a))) (to_rep
                                                  (rec__saturation__saturable_value__upper_bound
                                                  (us_split_fields1 b)))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const saturation__saturable_value__value__first__bit Int)

(declare-const saturation__saturable_value__value__last__bit Int)

(declare-const saturation__saturable_value__value__position Int)

;; saturation__saturable_value__value__first__bit_axiom
  (assert (<= 0 saturation__saturable_value__value__first__bit))

;; saturation__saturable_value__value__last__bit_axiom
  (assert
  (< saturation__saturable_value__value__first__bit saturation__saturable_value__value__last__bit))

;; saturation__saturable_value__value__position_axiom
  (assert (<= 0 saturation__saturable_value__value__position))

(declare-const saturation__saturable_value__upper_bound__first__bit Int)

(declare-const saturation__saturable_value__upper_bound__last__bit Int)

(declare-const saturation__saturable_value__upper_bound__position Int)

;; saturation__saturable_value__upper_bound__first__bit_axiom
  (assert (<= 0 saturation__saturable_value__upper_bound__first__bit))

;; saturation__saturable_value__upper_bound__last__bit_axiom
  (assert
  (< saturation__saturable_value__upper_bound__first__bit saturation__saturable_value__upper_bound__last__bit))

;; saturation__saturable_value__upper_bound__position_axiom
  (assert (<= 0 saturation__saturable_value__upper_bound__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((saturable_value__ref 0))
(((saturable_value__refqtmk (saturable_value__content us_rep)))))
(define-fun saturable_value__ref_saturable_value__content__projection ((a saturable_value__ref)) us_rep 
  (saturable_value__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_158 (_ BitVec 16))
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool) (temp___do_typ_inv_157 Bool)) Bool true)

(assert
;; defqtvc
 ;; File "saturation.ads", line 11, characters 0-0
  (not
  (forall ((val____split_fields us_split_fields)
  (val____split_fields1 us_split_fields) (o (_ BitVec 16)) (o1 (_ BitVec 16))
  (o2 unsigned_16) (val____split_fields2 us_split_fields))
  (=> (= val____split_fields1 val____split_fields)
  (=>
  (= (to_rep
     (rec__saturation__saturable_value__upper_bound val____split_fields)) o)
  (=>
  (= (to_rep (rec__saturation__saturable_value__value val____split_fields)) o1)
  (=> (= (to_rep o2) (ite (bvule o1 o) o o1))
  (=>
  (= val____split_fields2 (us_split_fieldsqtmk o2
                          (rec__saturation__saturable_value__upper_bound
                          val____split_fields)))
  (= (bool_eq (us_repqtmk val____split_fields2)
     (us_repqtmk val____split_fields1)) true)))))))))
(check-sat)
(exit)
