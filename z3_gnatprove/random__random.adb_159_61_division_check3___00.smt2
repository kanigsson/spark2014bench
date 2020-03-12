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

(declare-fun nth ((_ BitVec 32) Int) Bool)

(declare-fun lsr ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun asr ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun lsl ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun rotate_right1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_left1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 32))) Int (ite (bvsge x (_ bv0 32))
                                            (bv2int x)
                                            (- (- 4294967296 (bv2int x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 4294967295)))

(declare-fun nth_bv ((_ BitVec 32) (_ BitVec 32)) Bool)

(declare-fun eq_sub_bv ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)
  (_ BitVec 32)) Bool)

(define-fun eq_sub ((a (_ BitVec 32)) (b (_ BitVec 32)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content (_ BitVec 32))))))
(declare-fun power ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun bv_min ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) y x))

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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-sort state_range 0)

(declare-fun state_rangeqtint (state_range) Int)

;; state_range'axiom
  (assert
  (forall ((i state_range))
  (and (<= 0 (state_rangeqtint i)) (<= (state_rangeqtint i) 623))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 623)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (state_range state_range) Bool)

(declare-const dummy1 state_range)

(declare-datatypes ()
((state_range__ref (state_range__refqtmk (state_range__content state_range)))))
(define-fun state_range__ref_state_range__content__projection ((a state_range__ref)) state_range 
  (state_range__content a))

(define-fun to_rep ((x state_range)) Int (state_rangeqtint x))

(declare-fun of_rep (Int) state_range)

;; inversion_axiom
  (assert
  (forall ((x state_range))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x state_range)) (! (in_range2
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort unsigned_32 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 32))

(declare-fun attr__ATTRIBUTE_IMAGE3 ((_ BitVec 32)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) (_ BitVec 32))

(declare-fun user_eq2 (unsigned_32 unsigned_32) Bool)

(declare-const dummy2 unsigned_32)

(declare-datatypes ()
((unsigned_32__ref (unsigned_32__refqtmk (unsigned_32__content unsigned_32)))))
(define-fun unsigned_32__ref_unsigned_32__content__projection ((a unsigned_32__ref)) unsigned_32 
  (unsigned_32__content a))

(declare-fun to_rep1 (unsigned_32) (_ BitVec 32))

(declare-fun of_rep1 ((_ BitVec 32)) unsigned_32)

;; inversion_axiom
  (assert
  (forall ((x unsigned_32))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 32)))
  (! (= (to_rep1 (of_rep1 x)) x) :pattern ((to_rep1 (of_rep1 x))) )))

(define-fun to_int2 ((x unsigned_32)) Int (bv2int (to_rep1 x)))

;; range_int_axiom
  (assert
  (forall ((x unsigned_32)) (! (uint_in_range
  (to_int2 x)) :pattern ((to_int2 x)) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int unsigned_32))))))
(declare-fun slide ((Array Int unsigned_32) Int Int) (Array Int unsigned_32))

;; slide_eq
  (assert
  (forall ((a (Array Int unsigned_32)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int unsigned_32)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int unsigned_32)) (a__first Int) (a__last Int)
  (b (Array Int unsigned_32)) (b__first Int)
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
  (forall ((a (Array Int unsigned_32)) (b (Array Int unsigned_32)))
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

(declare-const dummy3 (Array Int unsigned_32))

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

(declare-fun user_eq3 ((Array Int unsigned_32) (Array Int unsigned_32)) Bool)

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__random__generator__state (Array Int unsigned_32))(rec__random__generator__index state_range)))))
(define-fun us_split_fields_rec__random__generator__state__projection ((a us_split_fields)) (Array Int unsigned_32) 
  (rec__random__generator__state a))

(define-fun us_split_fields_rec__random__generator__index__projection ((a us_split_fields)) state_range 
  (rec__random__generator__index a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (bool_eq
                           (rec__random__generator__state
                           (us_split_fields1 a)) 0 623
                           (rec__random__generator__state
                           (us_split_fields1 b)) 0 623) true)
                        (= (to_rep
                           (rec__random__generator__index
                           (us_split_fields1 a))) (to_rep
                                                  (rec__random__generator__index
                                                  (us_split_fields1 b)))))
                   true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const random__generator__state__first__bit Int)

(declare-const random__generator__state__last__bit Int)

(declare-const random__generator__state__position Int)

;; random__generator__state__first__bit_axiom
  (assert (<= 0 random__generator__state__first__bit))

;; random__generator__state__last__bit_axiom
  (assert
  (< random__generator__state__first__bit random__generator__state__last__bit))

;; random__generator__state__position_axiom
  (assert (<= 0 random__generator__state__position))

(declare-const random__generator__index__first__bit Int)

(declare-const random__generator__index__last__bit Int)

(declare-const random__generator__index__position Int)

;; random__generator__index__first__bit_axiom
  (assert (<= 0 random__generator__index__first__bit))

;; random__generator__index__last__bit_axiom
  (assert
  (< random__generator__index__first__bit random__generator__index__last__bit))

;; random__generator__index__position_axiom
  (assert (<= 0 random__generator__index__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ()
((generator__ref (generator__refqtmk (generator__content us_rep)))))
(define-fun generator__ref_generator__content__projection ((a generator__ref)) us_rep 
  (generator__content a))

(define-fun dynamic_invariant1 ((temp___expr_176 (_ BitVec 32))
  (temp___is_init_172 Bool) (temp___skip_constant_173 Bool)
  (temp___do_toplevel_174 Bool) (temp___do_typ_inv_175 Bool)) Bool true)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const min1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const max1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const n (_ BitVec 32))

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const slop (_ BitVec 32))

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

;; n__def_axiom
  (assert (= n ((_ int2bv 32) (+ (- max1 min1) 1))))

;; slop__def_axiom
  (assert (= slop (bvadd (bvurem #xFFFFFFFF n) #x00000001)))

(define-fun dynamic_invariant2 ((temp___expr_169 Int)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (=>
                                     (or (= temp___is_init_165 true)
                                     (<= 0 623)) (in_range2 temp___expr_169)))

(declare-const g__split_fields us_split_fields)

(declare-const value Int)

(declare-const x (_ BitVec 32))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant value false false true true))

;; Assume
  (assert (dynamic_invariant min1 true false true true))

;; Assume
  (assert (dynamic_invariant max1 true false true true))

;; Assume
  (assert (<= min1 max1))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 x false false true true))

(declare-const spark__branch Bool)

;; H
  (assert
  (= spark__branch (and (ite (= min1 (- 2147483648)) true false) (ite (= 
                                                                 max1 2147483647)
                                                                 true false))))

;; H
  (assert (not (= spark__branch true)))

(define-fun o () Int (+ (- max1 min1) 1))

;; Ensures
  (assert (uint_in_range o))

;; Assume
  (assert (= ((_ int2bv 32) o) n))

;; Assume
  (assert (dynamic_invariant1 n true false true true))

(define-fun o1 () (_ BitVec 32) n)

(assert
;; defqtvc
 ;; File "random.ads", line 51, characters 0-0
  (not (not (= o1 #x00000000))))
(check-sat)
