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

(declare-fun nth ((_ BitVec 8) Int) Bool)

(declare-fun lsr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun asr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun lsl ((_ BitVec 8) Int) (_ BitVec 8))

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

(declare-fun rotate_right1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_left1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 8))) Int (ite (bvsge x (_ bv0 8))
                                           (bv2nat x) (- (- 256 (bv2nat x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 255)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvor (bvshl v (bvurem n (_ bv8 8))) (bvlshr v (bvsub (_ bv8 8) (bvurem n (_ bv8 8))))) 
  (rotate_left1 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvor (bvlshr v (bvurem n (_ bv8 8))) (bvshl v (bvsub (_ bv8 8) (bvurem n (_ bv8 8))))) 
  (rotate_right1 v (bv2nat n)))))

(declare-fun nth_bv ((_ BitVec 8) (_ BitVec 8)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
  (= (= (nth_bv x i) true) (not (= (bvand (bvlshr x i) #x01) #x00)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
  (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 8)) (i Int))
  (=> (and (<= 0 i) (< i 256)) (= (nth_bv x ((_ int2bv 8) i)) (nth x i)))))

(declare-fun eq_sub_bv ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 8)) (b (_ BitVec 8)) (i (_ BitVec 8))
  (n (_ BitVec 8)))
  (let ((mask (bvshl (bvsub (bvshl #x01 n) #x01) i)))
  (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub ((a (_ BitVec 8)) (b (_ BitVec 8)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 8)) (b (_ BitVec 8)) (i (_ BitVec 8))
  (n (_ BitVec 8)))
  (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content (_ BitVec 8))))))
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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-sort character 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (character character) Bool)

(declare-const dummy2 character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range3 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int character))))))
(declare-fun slide ((Array Int character) Int Int) (Array Int character))

;; slide_eq
  (assert
  (forall ((a (Array Int character)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int)
  (b (Array Int character)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_91 Int))
                           (=>
                           (and (<= a__first temp___idx_91)
                           (<= temp___idx_91 a__last))
                           (= (to_rep (select a temp___idx_91)) (to_rep
                                                                (select b (+ (- b__first a__first) temp___idx_91)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_91 Int))
  (=> (and (<= a__first temp___idx_91) (<= temp___idx_91 a__last))
  (= (to_rep (select a temp___idx_91)) (to_rep
                                       (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(declare-sort octet 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE4 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) (_ BitVec 8))

(declare-fun user_eq3 (octet octet) Bool)

(declare-const dummy3 octet)

(declare-datatypes ((octet__ref 0))
(((octet__refqtmk (octet__content octet)))))
(define-fun octet__ref_octet__content__projection ((a octet__ref)) octet 
  (octet__content a))

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

(define-fun to_int2 ((x octet)) Int (bv2nat (to_rep1 x)))

;; range_int_axiom
  (assert
  (forall ((x octet)) (! (uint_in_range
  (to_int2 x)) :pattern ((to_int2 x)) )))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int octet))))))
(declare-fun slide1 ((Array Int octet) Int Int) (Array Int octet))

;; slide_eq
  (assert
  (forall ((a (Array Int octet)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int octet)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int octet)) (a__first Int) (a__last Int)
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
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const address (Array Int octet))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort digit_type 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 48 x) (<= x 57)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq4 (digit_type digit_type) Bool)

(declare-const dummy4 digit_type)

(declare-datatypes ((digit_type__ref 0))
(((digit_type__refqtmk (digit_type__content digit_type)))))
(define-fun digit_type__ref_digit_type__content__projection ((a digit_type__ref)) digit_type 
  (digit_type__content a))

(declare-fun to_rep2 (digit_type) Int)

(declare-fun of_rep2 (Int) digit_type)

;; inversion_axiom
  (assert
  (forall ((x digit_type))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x digit_type)) (! (in_range4
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((map__ref2 0))
(((map__refqtmk2 (map__content2 (Array (_ BitVec 8) digit_type))))))
(declare-fun slide2 ((Array (_ BitVec 8) digit_type) (_ BitVec 8)
  (_ BitVec 8)) (Array (_ BitVec 8) digit_type))

;; slide_eq
  (assert
  (forall ((a (Array (_ BitVec 8) digit_type)))
  (forall ((first (_ BitVec 8)))
  (! (= (slide2 a first first) a) :pattern ((slide2 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array (_ BitVec 8) digit_type)))
  (forall ((old_first (_ BitVec 8)))
  (forall ((new_first (_ BitVec 8)))
  (forall ((i (_ BitVec 8)))
  (! (= (select (slide2 a old_first new_first) i) (select a (bvsub i (bvsub new_first old_first)))) :pattern ((select 
  (slide2 a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array (_ BitVec 8) digit_type))
  (a__first (_ BitVec 8)) (a__last (_ BitVec 8))
  (b (Array (_ BitVec 8) digit_type)) (b__first (_ BitVec 8))
  (b__last (_ BitVec 8))) Bool (ite (and
                                    (ite (bvule a__first a__last)
                                    (and (bvule b__first b__last)
                                    (= (bvsub a__last a__first) (bvsub b__last b__first)))
                                    (bvugt b__first b__last))
                                    (forall ((temp___idx_159 (_ BitVec 8)))
                                    (=>
                                    (and (bvule a__first temp___idx_159)
                                    (bvule temp___idx_159 a__last))
                                    (= (to_rep2 (select a temp___idx_159)) 
                                    (to_rep2
                                    (select b (bvadd (bvsub b__first a__first) temp___idx_159)))))))
                               true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array (_ BitVec 8) digit_type))
  (b (Array (_ BitVec 8) digit_type)))
  (forall ((a__first (_ BitVec 8)) (a__last (_ BitVec 8))
  (b__first (_ BitVec 8)) (b__last (_ BitVec 8)))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (bvule a__first a__last)
  (and (bvule b__first b__last)
  (= (bvsub a__last a__first) (bvsub b__last b__first)))
  (bvugt b__first b__last))
  (forall ((temp___idx_159 (_ BitVec 8)))
  (=> (and (bvule a__first temp___idx_159) (bvule temp___idx_159 a__last))
  (= (to_rep2 (select a temp___idx_159)) (to_rep2
                                         (select b (bvadd (bvsub b__first a__first) temp___idx_159)))))))))))

(declare-const digit_lookup_table (Array (_ BitVec 8) digit_type))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-sort ipv4_address_index_type 0)

(declare-fun ipv4_address_index_typeqtint (ipv4_address_index_type) Int)

;; ipv4_address_index_type'axiom
  (assert
  (forall ((i ipv4_address_index_type))
  (and (<= 1 (ipv4_address_index_typeqtint i))
  (<= (ipv4_address_index_typeqtint i) 4))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq5 (ipv4_address_index_type ipv4_address_index_type) Bool)

(declare-const dummy5 ipv4_address_index_type)

(declare-datatypes ((ipv4_address_index_type__ref 0))
(((ipv4_address_index_type__refqtmk
  (ipv4_address_index_type__content ipv4_address_index_type)))))
(define-fun ipv4_address_index_type__ref_ipv4_address_index_type__content__projection ((a ipv4_address_index_type__ref)) ipv4_address_index_type 
  (ipv4_address_index_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_202 (_ BitVec 8))
  (temp___is_init_198 Bool) (temp___skip_constant_199 Bool)
  (temp___do_toplevel_200 Bool) (temp___do_typ_inv_201 Bool)) Bool true)

(declare-sort address_string_index_type 0)

(declare-fun address_string_index_typeqtint (address_string_index_type) Int)

;; address_string_index_type'axiom
  (assert
  (forall ((i address_string_index_type))
  (and (<= 1 (address_string_index_typeqtint i))
  (<= (address_string_index_typeqtint i) 15))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 15)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq6 (address_string_index_type
  address_string_index_type) Bool)

(declare-const dummy6 address_string_index_type)

(declare-datatypes ((address_string_index_type__ref 0))
(((address_string_index_type__refqtmk
  (address_string_index_type__content address_string_index_type)))))
(define-fun address_string_index_type__ref_address_string_index_type__content__projection ((a address_string_index_type__ref)) address_string_index_type 
  (address_string_index_type__content a))

(define-fun dynamic_invariant2 ((temp___expr_240 Int)
  (temp___is_init_236 Bool) (temp___skip_constant_237 Bool)
  (temp___do_toplevel_238 Bool)
  (temp___do_typ_inv_239 Bool)) Bool (=>
                                     (or (= temp___is_init_236 true)
                                     (<= 1 15)) (in_range6 temp___expr_240)))

(declare-sort address_length_type 0)

(declare-fun address_length_typeqtint (address_length_type) Int)

;; address_length_type'axiom
  (assert
  (forall ((i address_length_type))
  (and (<= 7 (address_length_typeqtint i))
  (<= (address_length_typeqtint i) 15))))

(define-fun in_range7 ((x Int)) Bool (and (<= 7 x) (<= x 15)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq7 (address_length_type address_length_type) Bool)

(declare-const dummy7 address_length_type)

(declare-datatypes ((address_length_type__ref 0))
(((address_length_type__refqtmk
  (address_length_type__content address_length_type)))))
(define-fun address_length_type__ref_address_length_type__content__projection ((a address_length_type__ref)) address_length_type 
  (address_length_type__content a))

(define-fun dynamic_invariant3 ((temp___expr_257 Int)
  (temp___is_init_253 Bool) (temp___skip_constant_254 Bool)
  (temp___do_toplevel_255 Bool)
  (temp___do_typ_inv_256 Bool)) Bool (=>
                                     (or (= temp___is_init_253 true)
                                     (<= 7 15)) (in_range7 temp___expr_257)))

(define-fun dynamic_invariant4 ((temp___expr_276 Int)
  (temp___is_init_272 Bool) (temp___skip_constant_273 Bool)
  (temp___do_toplevel_274 Bool)
  (temp___do_typ_inv_275 Bool)) Bool (=>
                                     (or (= temp___is_init_272 true)
                                     (<= 48 57)) (in_range4 temp___expr_276)))

(declare-sort value_type 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 8))

(define-fun in_range8 ((x (_ BitVec 8))) Bool (and (bvule #x00 x)
                                              (bvule x #x09)))

(define-fun in_range_int ((x Int)) Bool (and (<= 0 x) (<= x 9)))

(declare-fun attr__ATTRIBUTE_IMAGE9 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check9 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE9 (us_image) (_ BitVec 8))

(declare-fun user_eq8 (value_type value_type) Bool)

(declare-const dummy8 value_type)

(declare-datatypes ((value_type__ref 0))
(((value_type__refqtmk (value_type__content value_type)))))
(define-fun value_type__ref_value_type__content__projection ((a value_type__ref)) value_type 
  (value_type__content a))

(declare-fun ada___network__addresses__digit_lookup_table__aggregate_def (Int
  Int Int Int Int Int Int Int Int Int) (Array (_ BitVec 8) digit_type))

(declare-sort skip_type 0)

(declare-fun skip_typeqtint (skip_type) Int)

;; skip_type'axiom
  (assert
  (forall ((i skip_type))
  (and (<= 1 (skip_typeqtint i)) (<= (skip_typeqtint i) 4))))

(define-fun in_range9 ((x Int)) Bool (and (<= 1 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE10 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check10 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE10 (us_image) Int)

(declare-fun user_eq9 (skip_type skip_type) Bool)

(declare-const dummy9 skip_type)

(declare-datatypes ((skip_type__ref 0))
(((skip_type__refqtmk (skip_type__content skip_type)))))
(define-fun skip_type__ref_skip_type__content__projection ((a skip_type__ref)) skip_type 
  (skip_type__content a))

(define-fun dynamic_invariant5 ((temp___expr_320 Int)
  (temp___is_init_316 Bool) (temp___skip_constant_317 Bool)
  (temp___do_toplevel_318 Bool)
  (temp___do_typ_inv_319 Bool)) Bool (=>
                                     (or (= temp___is_init_316 true)
                                     (<= 1 4)) (in_range9 temp___expr_320)))

(declare-fun temp_____aggregate_def_343 (Int) (Array Int character))

(define-fun dynamic_invariant6 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range3 temp___expr_74)))

(define-fun dynamic_invariant7 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant8 ((temp___expr_283 (_ BitVec 8))
  (temp___is_init_279 Bool) (temp___skip_constant_280 Bool)
  (temp___do_toplevel_281 Bool)
  (temp___do_typ_inv_282 Bool)) Bool (=>
                                     (or (= temp___is_init_279 true)
                                     (bvule #x00 #x09)) (in_range8
                                     temp___expr_283)))

;; digit_lookup_table__def_axiom
  (assert
  (= digit_lookup_table (ada___network__addresses__digit_lookup_table__aggregate_def
                        48 49 50 51 52 53 54 55 56 57)))

;; def_axiom
  (assert
  (forall ((temp___173 Int) (temp___174 Int) (temp___175 Int)
  (temp___176 Int) (temp___177 Int) (temp___178 Int) (temp___179 Int)
  (temp___180 Int) (temp___181 Int) (temp___182 Int))
  (let ((temp___172 (ada___network__addresses__digit_lookup_table__aggregate_def
                    temp___173 temp___174 temp___175 temp___176 temp___177
                    temp___178 temp___179 temp___180 temp___181 temp___182)))
  (=>
  (and
  (and (dynamic_invariant4 temp___173 true true true true)
  (dynamic_invariant4 temp___174 true true true true))
  (and
  (and
  (and (dynamic_invariant4 temp___175 true true true true)
  (dynamic_invariant4 temp___176 true true true true))
  (and (dynamic_invariant4 temp___177 true true true true)
  (dynamic_invariant4 temp___178 true true true true)))
  (and
  (and (dynamic_invariant4 temp___179 true true true true)
  (dynamic_invariant4 temp___180 true true true true))
  (and (dynamic_invariant4 temp___181 true true true true)
  (dynamic_invariant4 temp___182 true true true true)))))
  (and
  (and (= (to_rep2 (select temp___172 #x00)) temp___173)
  (= (to_rep2 (select temp___172 #x01)) temp___174))
  (and
  (and
  (and (= (to_rep2 (select temp___172 #x02)) temp___175)
  (= (to_rep2 (select temp___172 #x03)) temp___176))
  (and (= (to_rep2 (select temp___172 #x04)) temp___177)
  (= (to_rep2 (select temp___172 #x05)) temp___178)))
  (and
  (and (= (to_rep2 (select temp___172 #x06)) temp___179)
  (= (to_rep2 (select temp___172 #x07)) temp___180))
  (and (= (to_rep2 (select temp___172 #x08)) temp___181)
  (= (to_rep2 (select temp___172 #x09)) temp___182)))))))))

;; def_axiom
  (assert
  (forall ((temp___345 Int))
  (=> (dynamic_invariant6 temp___345 true true true true)
  (forall ((temp___346 Int))
  (= (to_rep (select (temp_____aggregate_def_343 temp___345) temp___346)) temp___345)))))

(define-fun dynamic_invariant9 ((temp___expr_195 Int)
  (temp___is_init_191 Bool) (temp___skip_constant_192 Bool)
  (temp___do_toplevel_193 Bool)
  (temp___do_typ_inv_194 Bool)) Bool (=>
                                     (or (= temp___is_init_191 true)
                                     (<= 1 4)) (in_range5 temp___expr_195)))

(assert
;; defqtvc
 ;; File "network-addresses.ads", line 37, characters 0-0
  (not
  (forall ((character_count Int) (index Int) (count Int) (skip Int)
  (value (_ BitVec 8)) (digit_2 Int) (digit_1 Int) (digit_0 Int)
  (text (Array Int character)) (i Int))
  (=>
  (= (ada___network__addresses__digit_lookup_table__aggregate_def 48 49 50 51
     52 53 54 55 56 57) digit_lookup_table)
  (=> (dynamic_invariant3 character_count false false true true)
  (=> (dynamic_invariant2 index false false true true)
  (=> (dynamic_invariant count false false true true)
  (=> (dynamic_invariant5 skip false false true true)
  (=> (dynamic_invariant1 value false false true true)
  (=> (dynamic_invariant4 digit_2 false false true true)
  (=> (dynamic_invariant4 digit_1 false false true true)
  (=> (dynamic_invariant4 digit_0 false false true true)
  (=> (= text (temp_____aggregate_def_343 32))
  (=> (= i 1)
  (=> (= (and (ite (<= 1 i) true false) (ite (<= i 4) true false)) true)
  (=> (in_range1 (* 4 (- i 1)))
  (=> (in_range1 (* 2 (- i 1)))
  (forall ((text1 (Array Int character)) (index1 Int) (count1 Int)
  (skip1 Int) (value1 (_ BitVec 8)) (digit_21 Int) (digit_11 Int)
  (digit_01 Int) (i1 Int))
  (=> (and (<= (* 2 (- i1 1)) count1) (<= count1 (* 4 (- i1 1))))
  (=>
  (= (and (ite (and
               (and
               (and
               (and
               (and
               (and
               (and (dynamic_invariant5 skip1 false true true true)
               (in_range5 i1)) (dynamic_invariant1 value1 false true true
               true)) (dynamic_invariant4 digit_21 false true true true))
               (dynamic_invariant4 digit_11 false true true true))
               (dynamic_invariant2 index1 false true true true))
               (dynamic_invariant4 digit_01 false true true true))
               (dynamic_invariant count1 false true true true))
          true false) (ite (and (<= 1 i1) (<= i1 4)) true false)) true)
  (let ((o (+ 1 count1)))
  (=> (in_range1 o)
  (=> (in_range6 o)
  (forall ((index2 Int))
  (=> (= index2 o)
  (forall ((o1 (_ BitVec 8)))
  (=> (= (to_rep1 (select address i1)) o1)
  (forall ((value2 (_ BitVec 8)))
  (=> (= value2 o1)
  (forall ((o2 Int))
  (=> (= (to_rep2 (select digit_lookup_table (bvudiv value2 #x64))) o2)
  (forall ((digit_22 Int))
  (=> (= digit_22 o2)
  (forall ((value3 (_ BitVec 8)))
  (=> (= value3 (bvurem value2 #x64))
  (let ((temp___349 (bvudiv value3 #x0A)))
  (=> (and (bvule #x00 temp___349) (bvule temp___349 #x09))
  (forall ((o3 Int))
  (=> (= (to_rep2 (select digit_lookup_table temp___349)) o3)
  (forall ((digit_12 Int))
  (=> (= digit_12 o3)
  (forall ((value4 (_ BitVec 8)))
  (=> (= value4 (bvurem value3 #x0A))
  (=> (and (bvule #x00 value4) (bvule value4 #x09))
  (forall ((o4 Int))
  (=> (= (to_rep2 (select digit_lookup_table value4)) o4)
  (forall ((digit_02 Int))
  (=> (= digit_02 o4)
  (forall ((spark__branch Bool) (text2 (Array Int character)) (skip2 Int))
  (=>
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (= digit_22 48) false true))
  (ite (= spark__branch1 true)
  (and
  (exists ((o5 character))
  (and (= (to_rep o5) digit_22)
  (exists ((text3 (Array Int character)))
  (and (= text3 (store text1 (+ index2 0) o5))
  (exists ((o6 character))
  (and (= (to_rep o6) digit_12)
  (let ((temp___350 (+ index2 1)))
  (and (and (<= 1 temp___350) (<= temp___350 15))
  (exists ((text4 (Array Int character)))
  (and (= text4 (store text3 temp___350 o6))
  (exists ((o7 character))
  (and (= (to_rep o7) digit_02)
  (let ((temp___351 (+ index2 2)))
  (and (and (<= 1 temp___351) (<= temp___351 15))
  (and (= text2 (store text4 temp___351 o7)) (= skip2 3))))))))))))))))
  (= spark__branch spark__branch1))
  (and (= spark__branch (ite (= digit_12 48) false true))
  (ite (= spark__branch true)
  (exists ((o5 character))
  (and (= (to_rep o5) digit_12)
  (exists ((text3 (Array Int character)))
  (and (= text3 (store text1 (+ index2 0) o5))
  (exists ((o6 character))
  (and (= (to_rep o6) digit_02)
  (let ((temp___352 (+ index2 1)))
  (and (and (<= 1 temp___352) (<= temp___352 15))
  (and (= text2 (store text3 temp___352 o6)) (= skip2 2))))))))))
  (exists ((o5 character))
  (and (= (to_rep o5) digit_02)
  (and (= text2 (store text1 (+ index2 0) o5)) (= skip2 1)))))))))
  (forall ((spark__branch1 Bool))
  (=> (= spark__branch1 (ite (= i1 4) false true))
  (=> (= spark__branch1 true)
  (forall ((o5 character)) (=> (= (to_rep o5) 46) (<= 1 (+ index2 skip2)))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
