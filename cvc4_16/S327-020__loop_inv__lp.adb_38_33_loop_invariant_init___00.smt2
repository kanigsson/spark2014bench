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

(declare-fun power (Int Int) Int)

;; Power_0
  (assert (forall ((x Int)) (= (power x 0) 1)))

;; Power_s
  (assert
  (forall ((x Int) (n Int))
  (=> (<= 0 n) (= (power x (+ n 1)) (* x (power x n))))))

;; Power_s_alt
  (assert
  (forall ((x Int) (n Int))
  (=> (< 0 n) (= (power x n) (* x (power x (- n 1)))))))

;; Power_1
  (assert (forall ((x Int)) (= (power x 1) x)))

;; Power_sum
  (assert
  (forall ((x Int) (n Int) (m Int))
  (=> (<= 0 n)
  (=> (<= 0 m) (= (power x (+ n m)) (* (power x n) (power x m)))))))

;; Power_mult
  (assert
  (forall ((x Int) (n Int) (m Int))
  (=> (<= 0 n) (=> (<= 0 m) (= (power x (* n m)) (power (power x n) m))))))

;; Power_comm1
  (assert
  (forall ((x Int) (y Int))
  (=> (= (* x y) (* y x))
  (forall ((n Int)) (=> (<= 0 n) (= (* (power x n) y) (* y (power x n))))))))

;; Power_comm2
  (assert
  (forall ((x Int) (y Int))
  (=> (= (* x y) (* y x))
  (forall ((n Int))
  (=> (<= 0 n) (= (power (* x y) n) (* (power x n) (power y n))))))))

;; Power_non_neg
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (<= 0 y)) (<= 0 (power x y)))))

;; Power_pos
  (assert
  (forall ((x Int) (y Int)) (=> (and (< 0 x) (<= 0 y)) (< 0 (power x y)))))

;; Power_monotonic
  (assert
  (forall ((x Int) (n Int) (m Int))
  (=> (and (< 0 x) (and (<= 0 n) (<= n m))) (<= (power x n) (power x m)))))

(declare-fun nth ((_ BitVec 64) Int) Bool)

(declare-fun lsr ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun asr ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun lsl ((_ BitVec 64) Int) (_ BitVec 64))

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

(declare-fun rotate_right1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun rotate_left1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 64))) Int (ite (bvsge x (_ bv0 64))
                                            (bv2nat x)
                                            (- (- 18446744073709551616 (bv2nat x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i)
                                         (<= i 18446744073709551615)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvor (bvshl v (bvurem n (_ bv64 64))) (bvlshr v (bvsub (_ bv64 64) (bvurem n (_ bv64 64))))) 
  (rotate_left1 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvor (bvlshr v (bvurem n (_ bv64 64))) (bvshl v (bvsub (_ bv64 64) (bvurem n (_ bv64 64))))) 
  (rotate_right1 v (bv2nat n)))))

(declare-fun nth_bv ((_ BitVec 64) (_ BitVec 64)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 64)) (i (_ BitVec 64)))
  (= (= (nth_bv x i) true)
  (not (= (bvand (bvlshr x i) #x0000000000000001) #x0000000000000000)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 64)) (i (_ BitVec 64)))
  (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 64)) (i Int))
  (=> (and (<= 0 i) (< i 18446744073709551616))
  (= (nth_bv x ((_ int2bv 64) i)) (nth x i)))))

(declare-fun eq_sub_bv ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)
  (_ BitVec 64)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 64)) (b (_ BitVec 64)) (i (_ BitVec 64))
  (n (_ BitVec 64)))
  (let ((mask (bvshl (bvsub (bvshl #x0000000000000001 n) #x0000000000000001) i)))
  (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub ((a (_ BitVec 64)) (b (_ BitVec 64)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 64)) (b (_ BitVec 64)) (i (_ BitVec 64))
  (n (_ BitVec 64)))
  (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content (_ BitVec 64))))))
(declare-fun power1 ((_ BitVec 64) Int) (_ BitVec 64))

(define-fun bv_min ((x (_ BitVec 64))
  (y (_ BitVec 64))) (_ BitVec 64) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 64))
  (y (_ BitVec 64))) (_ BitVec 64) (ite (bvule x y) y x))

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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort universal_integer 0)

(declare-fun universal_integerqtint (universal_integer) Int)

;; universal_integer'axiom
  (assert
  (forall ((i universal_integer))
  (and (<= (- 9223372036854775808) (universal_integerqtint i))
  (<= (universal_integerqtint i) 9223372036854775807))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                     (<= x 9223372036854775807)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (universal_integer universal_integer) Bool)

(declare-const dummy1 universal_integer)

(declare-datatypes ((universal_integer__ref 0))
(((universal_integer__refqtmk (universal_integer__content universal_integer)))))
(define-fun universal_integer__ref_universal_integer__content__projection ((a universal_integer__ref)) universal_integer 
  (universal_integer__content a))

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i1 integer))
  (and (<= (- 2147483648) (integerqtint i1))
  (<= (integerqtint i1) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int natural))))))
(declare-fun slide ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i1 Int))
  (! (= (select (slide a old_first new_first) i1) (select a (- i1 (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i1)) ))))))

(define-fun bool_eq ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_157 Int))
                           (=>
                           (and (<= a__first temp___idx_157)
                           (<= temp___idx_157 a__last))
                           (= (to_rep (select a temp___idx_157)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_157)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int natural)) (b (Array Int natural)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_157 Int))
  (=> (and (<= a__first temp___idx_157) (<= temp___idx_157 a__last))
  (= (to_rep (select a temp___idx_157)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_157)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range3 f)
     (=> (in_range3 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range3 low)
                   (and (in_range3 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int natural) (elts a))

(define-fun of_array ((a (Array Int natural)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((n_array__ref 0))
(((n_array__refqtmk (n_array__content us_t)))))
(define-fun n_array__ref_n_array__content__2__projection ((a n_array__ref)) us_t 
  (n_array__content a))

(declare-const powers us_t)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort u64 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

(declare-fun attr__ATTRIBUTE_IMAGE4 ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) (_ BitVec 64))

(declare-fun user_eq4 (u64 u64) Bool)

(declare-const dummy4 u64)

(declare-datatypes ((u64__ref 0))
(((u64__refqtmk (u64__content u64)))))
(define-fun u64__ref_u64__content__projection ((a u64__ref)) u64 (u64__content
                                                                 a))

(define-fun dynamic_invariant1 ((temp___expr_259 us_t)
  (temp___is_init_255 Bool) (temp___skip_constant_256 Bool)
  (temp___do_toplevel_257 Bool)
  (temp___do_typ_inv_258 Bool)) Bool (=>
                                     (not (= temp___skip_constant_256 true))
                                     (dynamic_property (- 2147483648)
                                     2147483647 (first1 temp___expr_259)
                                     (last1 temp___expr_259))))

(declare-sort t10b 0)

(declare-fun t10bqtint (t10b) Int)

;; t10b'axiom
  (assert
  (forall ((i1 t10b))
  (and (<= (- 2147483648) (t10bqtint i1)) (<= (t10bqtint i1) (- 2147483623)))))

(define-fun in_range4 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x (- 2147483623))))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (t10b t10b) Bool)

(declare-const dummy5 t10b)

(declare-datatypes ((t10b__ref 0))
(((t10b__refqtmk (t10b__content t10b)))))
(define-fun t10b__ref_t10b__content__projection ((a t10b__ref)) t10b 
  (t10b__content a))

(declare-fun lp__power1__powers__aggregate_def (Int Int Int Int Int Int Int
  Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int Int
  Int) (Array Int natural))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (integer integer) Bool)

(declare-const dummy6 integer)

(declare-datatypes ((t14b__ref 0))
(((t14b__refqtmk (t14b__content integer)))))
(define-fun t14b__ref_t14b__content__projection ((a t14b__ref)) integer 
  (t14b__content a))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range3 temp___expr_18)))

(define-fun dynamic_invariant3 ((temp___expr_151 Int)
  (temp___is_init_147 Bool) (temp___skip_constant_148 Bool)
  (temp___do_toplevel_149 Bool)
  (temp___do_typ_inv_150 Bool)) Bool (=>
                                     (or (= temp___is_init_147 true)
                                     (<= (- 9223372036854775808) 9223372036854775807))
                                     (in_range2 temp___expr_151)))

;; powers__def_axiom
  (assert
  (= powers (of_array
            (lp__power1__powers__aggregate_def 62 60 58 56 54 52 50 48 46 44
            42 40 38 36 34 32 30 28 26 24 22 20 18 16 14 12) (- 2147483648)
            (- 2147483623))))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 62))

(declare-const rliteral1 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral1) 60))

(declare-const rliteral2 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral2) 58))

(declare-const rliteral3 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral3) 56))

(declare-const rliteral4 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral4) 54))

(declare-const rliteral5 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral5) 52))

(declare-const rliteral6 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral6) 50))

(declare-const rliteral7 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral7) 48))

(declare-const rliteral8 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral8) 46))

(declare-const rliteral9 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral9) 44))

(declare-const rliteral10 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral10) 42))

(declare-const rliteral11 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral11) 40))

(declare-const rliteral12 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral12) 38))

(declare-const rliteral13 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral13) 36))

(declare-const rliteral14 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral14) 34))

(declare-const rliteral15 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral15) 32))

(declare-const rliteral16 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral16) 30))

(declare-const rliteral17 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral17) 28))

(declare-const rliteral18 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral18) 26))

(declare-const rliteral19 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral19) 24))

(declare-const rliteral20 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral20) 22))

(declare-const rliteral21 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral21) 20))

(declare-const rliteral22 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral22) 18))

(declare-const rliteral23 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral23) 16))

(declare-const rliteral24 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral24) 14))

(declare-const rliteral25 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral25) 12))

;; def_axiom
  (assert
  (forall ((temp___187 Int) (temp___188 Int) (temp___189 Int)
  (temp___190 Int) (temp___191 Int) (temp___192 Int) (temp___193 Int)
  (temp___194 Int) (temp___195 Int) (temp___196 Int) (temp___197 Int)
  (temp___198 Int) (temp___199 Int) (temp___200 Int) (temp___201 Int)
  (temp___202 Int) (temp___203 Int) (temp___204 Int) (temp___205 Int)
  (temp___206 Int) (temp___207 Int) (temp___208 Int) (temp___209 Int)
  (temp___210 Int) (temp___211 Int) (temp___212 Int))
  (let ((temp___186 (lp__power1__powers__aggregate_def temp___187 temp___188
                    temp___189 temp___190 temp___191 temp___192 temp___193
                    temp___194 temp___195 temp___196 temp___197 temp___198
                    temp___199 temp___200 temp___201 temp___202 temp___203
                    temp___204 temp___205 temp___206 temp___207 temp___208
                    temp___209 temp___210 temp___211 temp___212)))
  (=>
  (and
  (and (dynamic_invariant temp___187 true true true true) (dynamic_invariant
  temp___188 true true true true))
  (and
  (and
  (and
  (and
  (and (dynamic_invariant temp___189 true true true true) (dynamic_invariant
  temp___190 true true true true)) (dynamic_invariant temp___191 true true
  true true))
  (and
  (and (dynamic_invariant temp___192 true true true true) (dynamic_invariant
  temp___193 true true true true)) (dynamic_invariant temp___194 true true
  true true)))
  (and
  (and
  (and (dynamic_invariant temp___195 true true true true) (dynamic_invariant
  temp___196 true true true true)) (dynamic_invariant temp___197 true true
  true true))
  (and
  (and (dynamic_invariant temp___198 true true true true) (dynamic_invariant
  temp___199 true true true true)) (dynamic_invariant temp___200 true true
  true true))))
  (and
  (and
  (and
  (and (dynamic_invariant temp___201 true true true true) (dynamic_invariant
  temp___202 true true true true)) (dynamic_invariant temp___203 true true
  true true))
  (and
  (and (dynamic_invariant temp___204 true true true true) (dynamic_invariant
  temp___205 true true true true)) (dynamic_invariant temp___206 true true
  true true)))
  (and
  (and
  (and (dynamic_invariant temp___207 true true true true) (dynamic_invariant
  temp___208 true true true true)) (dynamic_invariant temp___209 true true
  true true))
  (and
  (and (dynamic_invariant temp___210 true true true true) (dynamic_invariant
  temp___211 true true true true)) (dynamic_invariant temp___212 true true
  true true))))))
  (and
  (and (= (select temp___186 (- 2147483648)) rliteral)
  (= (select temp___186 (- 2147483647)) rliteral1))
  (and
  (and
  (and
  (and
  (and (= (select temp___186 (- 2147483646)) rliteral2)
  (= (select temp___186 (- 2147483645)) rliteral3))
  (= (select temp___186 (- 2147483644)) rliteral4))
  (and
  (and (= (select temp___186 (- 2147483643)) rliteral5)
  (= (select temp___186 (- 2147483642)) rliteral6))
  (= (select temp___186 (- 2147483641)) rliteral7)))
  (and
  (and
  (and (= (select temp___186 (- 2147483640)) rliteral8)
  (= (select temp___186 (- 2147483639)) rliteral9))
  (= (select temp___186 (- 2147483638)) rliteral10))
  (and
  (and (= (select temp___186 (- 2147483637)) rliteral11)
  (= (select temp___186 (- 2147483636)) rliteral12))
  (= (select temp___186 (- 2147483635)) rliteral13))))
  (and
  (and
  (and
  (and (= (select temp___186 (- 2147483634)) rliteral14)
  (= (select temp___186 (- 2147483633)) rliteral15))
  (= (select temp___186 (- 2147483632)) rliteral16))
  (and
  (and (= (select temp___186 (- 2147483631)) rliteral17)
  (= (select temp___186 (- 2147483630)) rliteral18))
  (= (select temp___186 (- 2147483629)) rliteral19)))
  (and
  (and
  (and (= (select temp___186 (- 2147483628)) rliteral20)
  (= (select temp___186 (- 2147483627)) rliteral21))
  (= (select temp___186 (- 2147483626)) rliteral22))
  (and
  (and (= (select temp___186 (- 2147483625)) rliteral23)
  (= (select temp___186 (- 2147483624)) rliteral24))
  (= (select temp___186 (- 2147483623)) rliteral25))))))))))

(define-fun dynamic_invariant4 ((temp___expr_246 (_ BitVec 64))
  (temp___is_init_242 Bool) (temp___skip_constant_243 Bool)
  (temp___do_toplevel_244 Bool) (temp___do_typ_inv_245 Bool)) Bool true)

(assert
;; defqtvc
 ;; File "lp.ads", line 9, characters 0-0
  (not
  (forall ((previous Int))
  (=> (dynamic_invariant i true false true true)
  (=>
  (= (of_array
     (lp__power1__powers__aggregate_def 62 60 58 56 54 52 50 48 46 44 42 40
     38 36 34 32 30 28 26 24 22 20 18 16 14 12) (- 2147483648)
     (- 2147483623)) powers)
  (=> (dynamic_invariant1 powers true false true true)
  (=> (= previous 64)
  (=> (dynamic_invariant previous true false true true)
  (=>
  (forall ((temp___275 Int))
  (=> (and (<= (first1 powers) temp___275) (<= temp___275 (last1 powers)))
  (let ((k (to_rep (select (to_array powers) temp___275))))
  (let ((temp___276 (ite (< k 18446744073709551616)
                    (bvshl #x0000000000000001 ((_ int2bv 64) k))
                    #x0000000000000000)))
  (and (bvule #x0000000000000000 temp___276)
  (bvule temp___276 #xFFFFFFFFFFFFFFFF))))))
  (let ((temp___277 (first1 powers)))
  (forall ((c13b Int))
  (=> (= c13b temp___277)
  (=>
  (= (and (ite (<= temp___277 c13b) true false) (ite (<= c13b (last1 powers))
                                                true false)) true)
  (=>
  (forall ((temp___293 Int))
  (=> (and (<= (first1 powers) temp___293) (<= temp___293 (last1 powers)))
  (let ((k (to_rep (select (to_array powers) temp___293))))
  (let ((temp___294 (ite (< k 18446744073709551616)
                    (bvshl #x0000000000000001 ((_ int2bv 64) k))
                    #x0000000000000000)))
  (and (bvule #x0000000000000000 temp___294)
  (bvule temp___294 #xFFFFFFFFFFFFFFFF))))))
  (bvule #x0000000000000000 (let ((temp___286 (to_rep
                                              (select (to_array powers) c13b))))
                            (ite (< temp___286 18446744073709551616)
                            (bvshl #x0000000000000001 ((_ int2bv 64) temp___286))
                            #x0000000000000000)))))))))))))))))
(check-sat)
(exit)
