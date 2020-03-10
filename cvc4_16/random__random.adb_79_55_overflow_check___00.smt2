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

(declare-fun rotate_right1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_left1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 32))) Int (ite (bvsge x (_ bv0 32))
                                            (bv2nat x)
                                            (- (- 4294967296 (bv2nat x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 4294967295)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvor (bvshl v (bvurem n (_ bv32 32))) (bvlshr v (bvsub (_ bv32 32) (bvurem n (_ bv32 32))))) 
  (rotate_left1 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvor (bvlshr v (bvurem n (_ bv32 32))) (bvshl v (bvsub (_ bv32 32) (bvurem n (_ bv32 32))))) 
  (rotate_right1 v (bv2nat n)))))

(declare-fun nth_bv ((_ BitVec 32) (_ BitVec 32)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 32)) (i (_ BitVec 32)))
  (= (= (nth_bv x i) true)
  (not (= (bvand (bvlshr x i) #x00000001) #x00000000)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 32)) (i (_ BitVec 32)))
  (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 32)) (i Int))
  (=> (and (<= 0 i) (< i 4294967296))
  (= (nth_bv x ((_ int2bv 32) i)) (nth x i)))))

(declare-fun eq_sub_bv ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)
  (_ BitVec 32)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 32)) (b (_ BitVec 32)) (i (_ BitVec 32))
  (n (_ BitVec 32)))
  (let ((mask (bvshl (bvsub (bvshl #x00000001 n) #x00000001) i)))
  (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub ((a (_ BitVec 32)) (b (_ BitVec 32)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 32)) (b (_ BitVec 32)) (i (_ BitVec 32))
  (n (_ BitVec 32)))
  (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content (_ BitVec 32))))))
(declare-fun power ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun bv_min ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) y x))

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

(declare-sort long_long_integer 0)

(declare-fun long_long_integerqtint (long_long_integer) Int)

;; long_long_integer'axiom
  (assert
  (forall ((i long_long_integer))
  (and (<= (- 9223372036854775808) (long_long_integerqtint i))
  (<= (long_long_integerqtint i) 9223372036854775807))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                     (<= x 9223372036854775807)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (long_long_integer long_long_integer) Bool)

(declare-const dummy1 long_long_integer)

(declare-datatypes ((long_long_integer__ref 0))
(((long_long_integer__refqtmk (long_long_integer__content long_long_integer)))))
(define-fun long_long_integer__ref_long_long_integer__content__projection ((a long_long_integer__ref)) long_long_integer 
  (long_long_integer__content a))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (natural natural) Bool)

(declare-const dummy2 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range3
                                    temp___expr_39)))

(declare-sort state_range 0)

(declare-fun state_rangeqtint (state_range) Int)

;; state_range'axiom
  (assert
  (forall ((i state_range))
  (and (<= 0 (state_rangeqtint i)) (<= (state_rangeqtint i) 623))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 623)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (state_range state_range) Bool)

(declare-const dummy3 state_range)

(declare-datatypes ((state_range__ref 0))
(((state_range__refqtmk (state_range__content state_range)))))
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
  (forall ((x state_range)) (! (in_range4
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort unsigned_32 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 32))

(declare-fun attr__ATTRIBUTE_IMAGE5 ((_ BitVec 32)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) (_ BitVec 32))

(declare-fun user_eq4 (unsigned_32 unsigned_32) Bool)

(declare-const dummy4 unsigned_32)

(declare-datatypes ((unsigned_32__ref 0))
(((unsigned_32__refqtmk (unsigned_32__content unsigned_32)))))
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

(define-fun to_int2 ((x unsigned_32)) Int (bv2nat (to_rep1 x)))

;; range_int_axiom
  (assert
  (forall ((x unsigned_32)) (! (uint_in_range
  (to_int2 x)) :pattern ((to_int2 x)) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int unsigned_32))))))
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

(declare-const dummy5 (Array Int unsigned_32))

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

(declare-fun user_eq5 ((Array Int unsigned_32) (Array Int unsigned_32)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__random__generator__state (Array Int unsigned_32))(rec__random__generator__index state_range)))))
(define-fun us_split_fields_rec__random__generator__state__projection ((a us_split_fields)) (Array Int unsigned_32) 
  (rec__random__generator__state a))

(define-fun us_split_fields_rec__random__generator__index__projection ((a us_split_fields)) state_range 
  (rec__random__generator__index a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
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

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ((generator__ref 0))
(((generator__refqtmk (generator__content us_rep)))))
(define-fun generator__ref_generator__content__projection ((a generator__ref)) us_rep 
  (generator__content a))

(declare-fun reset1 ((_ BitVec 32)) us_rep)

(declare-fun reset__function_guard (us_rep (_ BitVec 32)) Bool)

(define-fun dynamic_invariant1 ((temp___expr_176 (_ BitVec 32))
  (temp___is_init_172 Bool) (temp___skip_constant_173 Bool)
  (temp___do_toplevel_174 Bool) (temp___do_typ_inv_175 Bool)) Bool true)

;; reset__post_axiom
  (assert true)

(define-fun to_rep2 ((x integer)) Int (integerqtint x))

(declare-fun of_rep2 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep2 (first (mk f l))) f) (= (to_rep2 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int unsigned_32))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int unsigned_32) (elts a))

(define-fun of_array ((a (Array Int unsigned_32)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep2 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep2 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size1 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment2))

(define-fun bool_eq2 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep2 (first (rt x)))
                 (to_rep2 (last (rt x))) (elts y) (to_rep2 (first (rt y)))
                 (to_rep2 (last (rt y)))))

(declare-fun user_eq7 (us_t us_t) Bool)

(declare-const dummy7 us_t)

(declare-datatypes ((initialization_vector__ref 0))
(((initialization_vector__refqtmk (initialization_vector__content us_t)))))
(define-fun initialization_vector__ref_initialization_vector__content__projection ((a initialization_vector__ref)) us_t 
  (initialization_vector__content a))

(declare-const initiator us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun to_state (Int) (_ BitVec 32))

(declare-fun to_state__function_guard ((_ BitVec 32) Int) Bool)

(define-fun dynamic_invariant2 ((temp___expr_169 Int)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (=>
                                     (or (= temp___is_init_165 true)
                                     (<= 0 623)) (in_range4 temp___expr_169)))

;; to_state__post_axiom
  (assert
  (forall ((s Int))
  (! (=> (dynamic_invariant2 s true true true true)
     (let ((result (to_state s)))
     (=> (to_state__function_guard result s) (dynamic_invariant1 result true
     false true true)))) :pattern ((to_state s)) )))

;; to_state__def_axiom
  (assert
  (forall ((s Int))
  (! (=> (dynamic_invariant2 s true true true true)
     (= (to_state s) ((_ int2bv 32) s))) :pattern ((to_state s)) )))

(declare-fun to_state1 (Int) (_ BitVec 32))

(declare-fun to_state__function_guard1 ((_ BitVec 32) Int) Bool)

;; to_state__post_axiom
  (assert
  (forall ((s Int))
  (! (=> (dynamic_invariant s true true true true)
     (let ((result (to_state1 s)))
     (=> (to_state__function_guard1 result s) (dynamic_invariant1 result true
     false true true)))) :pattern ((to_state1 s)) )))

;; to_state__def_axiom
  (assert
  (forall ((s Int))
  (! (=> (dynamic_invariant s true true true true)
     (= (to_state1 s) ((_ int2bv 32) s))) :pattern ((to_state1 s)) )))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(define-fun dynamic_invariant3 ((temp___expr_205 us_t)
  (temp___is_init_201 Bool) (temp___skip_constant_202 Bool)
  (temp___do_toplevel_203 Bool)
  (temp___do_typ_inv_204 Bool)) Bool (=>
                                     (not (= temp___skip_constant_202 true))
                                     (dynamic_property 0 2147483647
                                     (first1 temp___expr_205)
                                     (last1 temp___expr_205))))

(define-fun to_rep3 ((x long_long_integer)) Int (long_long_integerqtint x))

(declare-fun of_rep3 (Int) long_long_integer)

;; inversion_axiom
  (assert
  (forall ((x long_long_integer))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x long_long_integer)) (! (in_range2
  (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq8 (long_long_integer long_long_integer) Bool)

(declare-const dummy8 long_long_integer)

(declare-datatypes ((t4b__ref 0))
(((t4b__refqtmk (t4b__content long_long_integer)))))
(define-fun t4b__ref_t4b__content__projection ((a t4b__ref)) long_long_integer 
  (t4b__content a))

(declare-sort t5b 0)

(declare-fun t5bqtint (t5b) Int)

;; t5b'axiom
  (assert (forall ((i t5b)) (and (<= 1 (t5bqtint i)) (<= (t5bqtint i) 623))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 623)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq9 (t5b t5b) Bool)

(declare-const dummy9 t5b)

(declare-datatypes ((t5b__ref 0))
(((t5b__refqtmk (t5b__content t5b)))))
(define-fun t5b__ref_t5b__content__projection ((a t5b__ref)) t5b (t5b__content
                                                                 a))

(define-fun dynamic_invariant4 ((temp___expr_32 Int) (temp___is_init_28 Bool)
  (temp___skip_constant_29 Bool) (temp___do_toplevel_30 Bool)
  (temp___do_typ_inv_31 Bool)) Bool (=>
                                    (or (= temp___is_init_28 true)
                                    (<= (- 9223372036854775808) 9223372036854775807))
                                    (in_range2 temp___expr_32)))

(define-fun dynamic_invariant5 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(assert
;; defqtvc
 ;; File "random.ads", line 43, characters 0-0
  (not
  (forall ((i Int) (j Int))
  (=> (dynamic_invariant3 initiator true false true true)
  (=> (= (first1 initiator) 0)
  (=> (<= 1 (length initiator))
  (=> (= i 1)
  (=> (dynamic_invariant2 i true false true true)
  (=> (= j 0)
  (=> (dynamic_invariant j true false true true)
  (let ((random__reset__2__R3b__g__assume (reset1 #x012BD6AA)))
  (=> (reset__function_guard random__reset__2__R3b__g__assume #x012BD6AA)
  (forall ((g__split_fields us_split_fields))
  (=> (= g__split_fields (us_split_fields1 random__reset__2__R3b__g__assume))
  (forall ((k Int))
  (=> (= k 1)
  (=>
  (= (and (ite (<= 1 k) true false) (ite (<= k (max 624 (length initiator)))
                                    true false)) true)
  (let ((o (to_state1 j)))
  (=>
  (and (to_state__function_guard1 o j)
  (and (dynamic_invariant1 o true false true true) (= o ((_ int2bv 32) j))))
  (=> (and (<= (first1 initiator) j) (<= j (last1 initiator)))
  (forall ((o1 (_ BitVec 32)))
  (=> (= (to_rep1 (select (to_array initiator) j)) o1)
  (let ((temp___249 (- i 1)))
  (=> (and (<= 0 temp___249) (<= temp___249 623))
  (forall ((o2 (_ BitVec 32)))
  (=>
  (= (to_rep1
     (select (rec__random__generator__state g__split_fields) temp___249)) o2)
  (let ((temp___247 (- i 1)))
  (=> (and (<= 0 temp___247) (<= temp___247 623))
  (forall ((o3 (_ BitVec 32)))
  (=>
  (= (to_rep1
     (select (rec__random__generator__state g__split_fields) temp___247)) o3)
  (forall ((o4 (_ BitVec 32)))
  (=>
  (= (to_rep1 (select (rec__random__generator__state g__split_fields) i)) o4)
  (forall ((o5 unsigned_32))
  (=>
  (= (to_rep1 o5) (bvadd (bvadd (bvxor o4 (bvmul (bvxor o3 (bvlshr o2 ((_ int2bv 32) 30))) #x0019660D)) o1) o))
  (forall ((g__split_fields1 us_split_fields))
  (=>
  (= g__split_fields1 (us_split_fieldsqtmk
                      (store (rec__random__generator__state g__split_fields) i o5)
                      (rec__random__generator__index g__split_fields)))
  (forall ((spark__branch Bool) (i1 Int) (g__split_fields2 us_split_fields))
  (=>
  (and (= spark__branch (ite (= i 623) true false))
  (ite (= spark__branch true)
  (exists ((o6 (_ BitVec 32)))
  (and
  (= (to_rep1 (select (rec__random__generator__state g__split_fields1) 623)) o6)
  (exists ((o7 unsigned_32))
  (and (= (to_rep1 o7) o6)
  (and
  (= g__split_fields2 (us_split_fieldsqtmk
                      (store (rec__random__generator__state g__split_fields1) 0 o7)
                      (rec__random__generator__index g__split_fields1)))
  (= i1 1))))))
  (and (let ((o6 (+ i 1))) (and (in_range4 o6) (= i1 o6)))
  (= g__split_fields2 g__split_fields1))))
  (=> (not (= j (last1 initiator))) (in_range1 (+ j 1)))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
