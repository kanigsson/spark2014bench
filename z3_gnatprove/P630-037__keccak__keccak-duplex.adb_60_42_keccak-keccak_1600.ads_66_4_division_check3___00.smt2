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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

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

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

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

(declare-sort lane_type 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 64))

(declare-fun user_eq2 (lane_type lane_type) Bool)

(declare-const dummy2 lane_type)

(declare-datatypes ()
((lane_type__ref (lane_type__refqtmk (lane_type__content lane_type)))))
(define-fun lane_type__ref_lane_type__content__projection ((a lane_type__ref)) lane_type 
  (lane_type__content a))

(declare-fun to_rep1 (lane_type) (_ BitVec 64))

(declare-fun of_rep1 ((_ BitVec 64)) lane_type)

;; inversion_axiom
  (assert
  (forall ((x lane_type))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 64)))
  (! (= (to_rep1 (of_rep1 x)) x) :pattern ((to_rep1 (of_rep1 x))) )))

(define-fun to_int3 ((x lane_type)) Int (bv2int (to_rep1 x)))

;; range_int_axiom
  (assert
  (forall ((x lane_type)) (! (uint_in_range1
  (to_int3 x)) :pattern ((to_int3 x)) )))

(declare-sort map1 0)

(declare-datatypes () ((map__ref (map__refqtmk (map__content map1)))))
(declare-fun get (map1 (_ BitVec 8) (_ BitVec 8)) lane_type)

(declare-fun set (map1 (_ BitVec 8) (_ BitVec 8) lane_type) map1)

;; Select_eq
  (assert
  (forall ((m map1))
  (forall ((i (_ BitVec 8)))
  (forall ((j (_ BitVec 8)))
  (forall ((a lane_type))
  (! (= (get (set m i j a) i j) a) :pattern ((set m i j a)) ))))))

;; Select_neq
  (assert
  (forall ((m map1))
  (forall ((i (_ BitVec 8)) (i2 (_ BitVec 8)))
  (forall ((j (_ BitVec 8)) (j2 (_ BitVec 8)))
  (forall ((a lane_type))
  (! (=> (not (and (= i i2) (= j j2)))
     (= (get (set m i j a) i2 j2) (get m i2 j2))) :pattern ((get
                                                            (set m i j a) i2
                                                            j2)) :pattern (
  (set m i j a) (get m i2 j2)) ))))))

(declare-fun slide (map1 (_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) map1)

;; slide_def
  (assert
  (forall ((a map1))
  (forall ((new_first (_ BitVec 8)) (old_first (_ BitVec 8)))
  (forall ((new_first_2 (_ BitVec 8)) (old_first_2 (_ BitVec 8)))
  (forall ((i (_ BitVec 8)))
  (forall ((j (_ BitVec 8)))
  (! (= (get (slide a old_first new_first old_first_2 new_first_2) i j) 
  (get a (bvsub i (bvsub new_first old_first))
  (bvsub j (bvsub new_first_2 old_first_2)))) :pattern ((get
                                                        (slide a old_first
                                                        new_first old_first_2
                                                        new_first_2) i j)) )))))))

(define-fun bool_eq ((a map1) (a__first (_ BitVec 8)) (a__last (_ BitVec 8))
  (a__first_2 (_ BitVec 8)) (a__last_2 (_ BitVec 8)) (b map1)
  (b__first (_ BitVec 8)) (b__last (_ BitVec 8)) (b__first_2 (_ BitVec 8))
  (b__last_2 (_ BitVec 8))) Bool (ite (and
                                      (and
                                      (ite (bvule a__first a__last)
                                      (and (bvule b__first b__last)
                                      (= (bvsub a__last a__first) (bvsub b__last b__first)))
                                      (bvugt b__first b__last))
                                      (ite (bvule a__first_2 a__last_2)
                                      (and (bvule b__first_2 b__last_2)
                                      (= (bvsub a__last_2 a__first_2) (bvsub b__last_2 b__first_2)))
                                      (bvugt b__first_2 b__last_2)))
                                      (forall ((temp___idx_154 (_ BitVec 8))
                                      (temp___idx_155 (_ BitVec 8)))
                                      (=>
                                      (and
                                      (and (bvule a__first temp___idx_154)
                                      (bvule temp___idx_154 a__last))
                                      (and (bvule a__first_2 temp___idx_155)
                                      (bvule temp___idx_155 a__last_2)))
                                      (= (to_rep1
                                         (get a temp___idx_154
                                         temp___idx_155)) (to_rep1
                                                          (get b
                                                          (bvadd (bvsub b__first a__first) temp___idx_154)
                                                          (bvadd (bvsub b__first_2 a__first_2) temp___idx_155)))))))
                                 true false))

;; bool_eq_rev
  (assert
  (forall ((a map1) (b map1))
  (forall ((a__first (_ BitVec 8)) (a__last (_ BitVec 8))
  (a__first_2 (_ BitVec 8)) (a__last_2 (_ BitVec 8)) (b__first (_ BitVec 8))
  (b__last (_ BitVec 8)) (b__first_2 (_ BitVec 8)) (b__last_2 (_ BitVec 8)))
  (=>
  (= (bool_eq b b__first b__last b__first_2 b__last_2 a a__first a__last
     a__first_2 a__last_2) true)
  (and
  (and
  (ite (bvule a__first a__last)
  (and (bvule b__first b__last)
  (= (bvsub a__last a__first) (bvsub b__last b__first)))
  (bvugt b__first b__last))
  (ite (bvule a__first_2 a__last_2)
  (and (bvule b__first_2 b__last_2)
  (= (bvsub a__last_2 a__first_2) (bvsub b__last_2 b__first_2)))
  (bvugt b__first_2 b__last_2)))
  (forall ((temp___idx_154 (_ BitVec 8)) (temp___idx_155 (_ BitVec 8)))
  (=>
  (and (and (bvule a__first temp___idx_154) (bvule temp___idx_154 a__last))
  (and (bvule a__first_2 temp___idx_155) (bvule temp___idx_155 a__last_2)))
  (= (to_rep1 (get a temp___idx_154 temp___idx_155)) (to_rep1
                                                     (get b
                                                     (bvadd (bvsub b__first a__first) temp___idx_154)
                                                     (bvadd (bvsub b__first_2 a__first_2) temp___idx_155)))))))))))

(declare-sort index_number 0)

(declare-fun index_numberqtint (index_number) Int)

;; index_number'axiom
  (assert
  (forall ((i index_number))
  (and (<= 0 (index_numberqtint i)) (<= (index_numberqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (index_number index_number) Bool)

(declare-const dummy3 index_number)

(declare-datatypes ()
((index_number__ref
 (index_number__refqtmk (index_number__content index_number)))))
(define-fun index_number__ref_index_number__content__projection ((a index_number__ref)) index_number 
  (index_number__content a))

(declare-sort byte 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE4 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) (_ BitVec 8))

(declare-fun user_eq4 (byte byte) Bool)

(declare-const dummy4 byte)

(declare-datatypes () ((byte__ref (byte__refqtmk (byte__content byte)))))
(define-fun byte__ref_byte__content__projection ((a byte__ref)) byte 
  (byte__content a))

(declare-fun to_rep2 (byte) (_ BitVec 8))

(declare-fun of_rep2 ((_ BitVec 8)) byte)

;; inversion_axiom
  (assert
  (forall ((x byte)) (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep2 (of_rep2 x)) x) :pattern ((to_rep2 (of_rep2 x))) )))

(define-fun to_int4 ((x byte)) Int (bv2int (to_rep2 x)))

;; range_int_axiom
  (assert
  (forall ((x byte)) (! (uint_in_range (to_int4 x)) :pattern ((to_int4 x)) )))

(declare-datatypes ()
((map__ref1 (map__refqtmk1 (map__content1 (Array Int byte))))))
(declare-fun slide1 ((Array Int byte) Int Int) (Array Int byte))

;; slide_eq
  (assert
  (forall ((a (Array Int byte)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int byte)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int byte)) (a__first Int) (a__last Int)
  (b (Array Int byte)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_183 Int))
                           (=>
                           (and (<= a__first temp___idx_183)
                           (<= temp___idx_183 a__last))
                           (= (to_rep2 (select a temp___idx_183)) (to_rep2
                                                                  (select b (+ (- b__first a__first) temp___idx_183)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int byte)) (b (Array Int byte)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_183 Int))
  (=> (and (<= a__first temp___idx_183) (<= temp___idx_183 a__last))
  (= (to_rep2 (select a temp___idx_183)) (to_rep2
                                         (select b (+ (- b__first a__first) temp___idx_183)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int byte))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int byte) (elts a))

(define-fun of_array ((a (Array Int byte)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
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

(define-fun bool_eq2 ((x us_t)
  (y us_t)) Bool (bool_eq1 (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq5 (us_t us_t) Bool)

(declare-const dummy5 us_t)

(declare-datatypes ()
((byte_array__ref (byte_array__refqtmk (byte_array__content us_t)))))
(define-fun byte_array__ref_byte_array__content__projection ((a byte_array__ref)) us_t 
  (byte_array__content a))

(declare-const dummy6 map1)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq6 (map1 map1) Bool)

(declare-sort rate_number 0)

(declare-fun rate_numberqtint (rate_number) Int)

;; rate_number'axiom
  (assert
  (forall ((i rate_number))
  (and (<= 3 (rate_numberqtint i)) (<= (rate_numberqtint i) 1599))))

(define-fun in_range3 ((x Int)) Bool (and (<= 3 x) (<= x 1599)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq7 (rate_number rate_number) Bool)

(declare-const dummy7 rate_number)

(declare-datatypes ()
((rate_number__ref (rate_number__refqtmk (rate_number__content rate_number)))))
(define-fun rate_number__ref_rate_number__content__2__projection ((a rate_number__ref)) rate_number 
  (rate_number__content a))

(define-fun to_rep3 ((x rate_number)) Int (rate_numberqtint x))

(declare-fun of_rep3 (Int) rate_number)

;; inversion_axiom
  (assert
  (forall ((x rate_number))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x rate_number)) (! (in_range3
  (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__ada___keccak__keccak_1600__duplex__context__state map1)(rec__ada___keccak__keccak_1600__duplex__context__rate rate_number)))))
(define-fun us_split_fields_rec__ada___keccak__keccak_1600__duplex__context__state__projection ((a us_split_fields)) map1 
  (rec__ada___keccak__keccak_1600__duplex__context__state a))

(define-fun us_split_fields_rec__ada___keccak__keccak_1600__duplex__context__rate__projection ((a us_split_fields)) rate_number 
  (rec__ada___keccak__keccak_1600__duplex__context__rate a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq3 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (bool_eq
                           (rec__ada___keccak__keccak_1600__duplex__context__state
                           (us_split_fields1 a)) #x00 #x04 #x00 #x04
                           (rec__ada___keccak__keccak_1600__duplex__context__state
                           (us_split_fields1 b)) #x00 #x04 #x00 #x04) true)
                        (= (to_rep3
                           (rec__ada___keccak__keccak_1600__duplex__context__rate
                           (us_split_fields1 a))) (to_rep3
                                                  (rec__ada___keccak__keccak_1600__duplex__context__rate
                                                  (us_split_fields1 b)))))
                   true false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const ada___keccak__keccak_1600__duplex__context__state__first__bit Int)

(declare-const ada___keccak__keccak_1600__duplex__context__state__last__bit Int)

(declare-const ada___keccak__keccak_1600__duplex__context__state__position Int)

;; ada___keccak__keccak_1600__duplex__context__state__first__bit_axiom
  (assert
  (<= 0 ada___keccak__keccak_1600__duplex__context__state__first__bit))

;; ada___keccak__keccak_1600__duplex__context__state__last__bit_axiom
  (assert
  (< ada___keccak__keccak_1600__duplex__context__state__first__bit ada___keccak__keccak_1600__duplex__context__state__last__bit))

;; ada___keccak__keccak_1600__duplex__context__state__position_axiom
  (assert (<= 0 ada___keccak__keccak_1600__duplex__context__state__position))

(declare-const ada___keccak__keccak_1600__duplex__context__rate__first__bit Int)

(declare-const ada___keccak__keccak_1600__duplex__context__rate__last__bit Int)

(declare-const ada___keccak__keccak_1600__duplex__context__rate__position Int)

;; ada___keccak__keccak_1600__duplex__context__rate__first__bit_axiom
  (assert
  (<= 0 ada___keccak__keccak_1600__duplex__context__rate__first__bit))

;; ada___keccak__keccak_1600__duplex__context__rate__last__bit_axiom
  (assert
  (< ada___keccak__keccak_1600__duplex__context__rate__first__bit ada___keccak__keccak_1600__duplex__context__rate__last__bit))

;; ada___keccak__keccak_1600__duplex__context__rate__position_axiom
  (assert (<= 0 ada___keccak__keccak_1600__duplex__context__rate__position))

(declare-fun user_eq8 (us_rep us_rep) Bool)

(declare-const dummy8 us_rep)

(declare-datatypes ()
((context__ref (context__refqtmk (context__content us_rep)))))
(define-fun context__ref_context__content__2__projection ((a context__ref)) us_rep 
  (context__content a))

(declare-fun rate_of (us_rep) Int)

(declare-fun rate_of__function_guard (Int us_rep) Bool)

(define-fun dynamic_invariant2 ((temp___expr_522 Int)
  (temp___is_init_518 Bool) (temp___skip_constant_519 Bool)
  (temp___do_toplevel_520 Bool)
  (temp___do_typ_inv_521 Bool)) Bool (=>
                                     (or (= temp___is_init_518 true)
                                     (<= 3 1599)) (in_range3
                                     temp___expr_522)))

;; rate_of__post_axiom
  (assert
  (forall ((ctx us_rep))
  (! (let ((result (rate_of ctx)))
     (=> (rate_of__function_guard result ctx) (dynamic_invariant2 result true
     false true true))) :pattern ((rate_of ctx)) )))

;; rate_of__def_axiom
  (assert
  (forall ((ctx us_rep))
  (! (= (rate_of ctx) (to_rep3
                      (rec__ada___keccak__keccak_1600__duplex__context__rate
                      (us_split_fields1 ctx)))) :pattern ((rate_of ctx)) )))

(declare-fun max_input_length (us_rep) Int)

(declare-fun max_input_length__function_guard (Int us_rep) Bool)

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq9 (positive positive) Bool)

(declare-const dummy9 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant3 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range4
                                    temp___expr_46)))

;; max_input_length__post_axiom
  (assert
  (forall ((ctx us_rep))
  (! (let ((result (max_input_length ctx)))
     (=> (max_input_length__function_guard result ctx) (dynamic_invariant3
     result true false true true))) :pattern ((max_input_length ctx)) )))

;; max_input_length__def_axiom
  (assert
  (forall ((ctx us_rep))
  (! (and
     (forall ((ctx1 us_rep)) (rate_of__function_guard (rate_of ctx1) ctx1))
     (= (max_input_length ctx) (- (rate_of ctx) 2))) :pattern ((max_input_length
                                                               ctx)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const in_data us_t)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const in_data_bit_length Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const out_data__first integer)

(declare-const out_data__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const out_data_bit_length Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const num_bytes Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const r159s Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const r162s Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(define-fun dynamic_invariant4 ((temp___expr_280 us_t)
  (temp___is_init_276 Bool) (temp___skip_constant_277 Bool)
  (temp___do_toplevel_278 Bool)
  (temp___do_typ_inv_279 Bool)) Bool (=>
                                     (not (= temp___skip_constant_277 true))
                                     (dynamic_property 0 2147483647
                                     (first1 temp___expr_280)
                                     (last1 temp___expr_280))))

(declare-sort tTblockSP1 0)

(declare-fun tTblockSP1qtint (tTblockSP1) Int)

;; tTblockSP1'axiom
  (assert
  (forall ((i tTblockSP1))
  (and (<= 0 (tTblockSP1qtint i)) (<= (tTblockSP1qtint i) 199))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 199)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq10 (tTblockSP1 tTblockSP1) Bool)

(declare-const dummy10 tTblockSP1)

(declare-datatypes ()
((tTblockSP1__ref (tTblockSP1__refqtmk (tTblockSP1__content tTblockSP1)))))
(define-fun tTblockSP1__ref_tTblockSP1__content__projection ((a tTblockSP1__ref)) tTblockSP1 
  (tTblockSP1__content a))

(declare-datatypes () ((t156s__ref (t156s__refqtmk (t156s__content us_t)))))
(define-fun t156s__ref_t156s__content__projection ((a t156s__ref)) us_t 
  (t156s__content a))

(declare-datatypes () ((t158s__ref (t158s__refqtmk (t158s__content us_t)))))
(define-fun t158s__ref_t158s__content__projection ((a t158s__ref)) us_t 
  (t158s__content a))

(declare-datatypes () ((t161s__ref (t161s__refqtmk (t161s__content us_t)))))
(define-fun t161s__ref_t161s__content__projection ((a t161s__ref)) us_t 
  (t161s__content a))

(declare-datatypes () ((t164s__ref (t164s__refqtmk (t164s__content us_t)))))
(define-fun t164s__ref_t164s__content__projection ((a t164s__ref)) us_t 
  (t164s__content a))

(declare-fun ada___keccak__keccak_1600__duplex__duplex__block__aggregate_def ((_ BitVec 8)) (Array Int byte))

(define-fun dynamic_invariant5 ((temp___expr_273 (_ BitVec 8))
  (temp___is_init_269 Bool) (temp___skip_constant_270 Bool)
  (temp___do_toplevel_271 Bool) (temp___do_typ_inv_272 Bool)) Bool true)

(define-fun dynamic_invariant6 ((temp___expr_259 Int)
  (temp___is_init_255 Bool) (temp___skip_constant_256 Bool)
  (temp___do_toplevel_257 Bool)
  (temp___do_typ_inv_258 Bool)) Bool (=>
                                     (or (= temp___is_init_255 true)
                                     (<= 0 2147483647)) (in_range2
                                     temp___expr_259)))

;; def_axiom
  (assert
  (forall ((temp___1178 (_ BitVec 8)))
  (=> (dynamic_invariant5 temp___1178 true true true true)
  (forall ((temp___1179 Int))
  (= (to_rep2
     (select (ada___keccak__keccak_1600__duplex__duplex__block__aggregate_def
             temp___1178) temp___1179)) temp___1178)))))

;; num_bytes__def_axiom
  (assert (= num_bytes (div1 (+ in_data_bit_length 7) 8)))

(declare-const ctx__split_fields us_split_fields)

(declare-const ctx__split_fields1 us_split_fields)

;; H
  (assert (= ctx__split_fields1 ctx__split_fields))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant4 in_data true false true true))

;; Assume
  (assert (dynamic_invariant in_data_bit_length true false true true))

;; Assume
  (assert (dynamic_property 0 2147483647 (to_rep out_data__first)
  (to_rep out_data__last)))

;; Assume
  (assert (dynamic_invariant out_data_bit_length true false true true))

;; H
  (assert
  (forall ((ctx__split_fields2 us_split_fields))
  (max_input_length__function_guard
  (max_input_length (us_repqtmk ctx__split_fields2))
  (us_repqtmk ctx__split_fields2))))

;; H
  (assert
  (forall ((ctx__split_fields2 us_split_fields)) (rate_of__function_guard
  (rate_of (us_repqtmk ctx__split_fields2)) (us_repqtmk ctx__split_fields2))))

;; Assume
  (assert
  (and
  (and
  (and
  (<= in_data_bit_length (max_input_length (us_repqtmk ctx__split_fields)))
  (<= (div1 (+ in_data_bit_length 7) 8) (length1 in_data)))
  (<= out_data_bit_length (rate_of (us_repqtmk ctx__split_fields))))
  (= (length (to_rep out_data__first) (to_rep out_data__last)) (div1
                                                               (+ out_data_bit_length 7)
                                                               8))))

(define-fun usf () us_rep (us_repqtmk ctx__split_fields))

(declare-const block (Array Int byte))

;; H
  (assert
  (= block (ada___keccak__keccak_1600__duplex__duplex__block__aggregate_def
           #x00)))

;; Assume
  (assert true)

(define-fun o () Int (+ in_data_bit_length 7))

;; Ensures
  (assert (in_range o))

(define-fun o1 () Int (div1 o 8))

;; Ensures
  (assert (in_range1 o1))

;; Assume
  (assert (= o1 num_bytes))

;; Assume
  (assert (dynamic_invariant num_bytes true false true true))

(declare-const block1 (Array Int byte))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (< 0 num_bytes) true false)))

(declare-const usf1 (Array Int byte))

;; H
  (assert
  (ite (= spark__branch true)
  (let ((o2 (+ (first1 in_data) (- num_bytes 1))))
  (and (in_range o2)
  (let ((temp___1180 (first1 in_data)))
  (and
  (=> (<= temp___1180 o2)
  (and
  (and (<= (first1 in_data) temp___1180) (<= temp___1180 (last1 in_data)))
  (and (<= (first1 in_data) o2) (<= o2 (last1 in_data)))))
  (let ((temp___1182 (of_array (to_array in_data) temp___1180 o2)))
  (and
  (ite (<= (first1 temp___1182) (last1 temp___1182))
  (and (<= 0 (- num_bytes 1))
  (= (- (last1 temp___1182) (first1 temp___1182)) (- (- num_bytes 1) 0)))
  (< (- num_bytes 1) 0))
  (let ((temp___1183 (of_array
                     (slide1 (to_array temp___1182) (first1 temp___1182) 0) 0
                     (- num_bytes 1))))
  (let ((temp___1185 (- num_bytes 1)))
  (and
  (=> (<= 0 temp___1185)
  (and (and (<= 0 0) (<= 0 199))
  (and (<= 0 temp___1185) (<= temp___1185 199))))
  (let ((temp___1186 (of_array block 0 temp___1185)))
  (and
  (ite (<= (first1 temp___1183) (last1 temp___1183))
  (and (<= (first1 temp___1186) (last1 temp___1186))
  (= (- (last1 temp___1183) (first1 temp___1183)) (- (last1 temp___1186) 
  (first1 temp___1186)))) (< (last1 temp___1186) (first1 temp___1186)))
  (and
  (forall ((temp___1188 Int))
  (ite (and (<= 0 temp___1188) (<= temp___1188 (- num_bytes 1)))
  (= (select usf1 temp___1188) (select (to_array temp___1183) temp___1188))
  (= (select usf1 temp___1188) (select block temp___1188)))) (= block1 
  usf1))))))))))))) (= block1 block)))

(define-fun o2 () us_rep (us_repqtmk ctx__split_fields))

(define-fun o3 () Int (rate_of o2))

;; H
  (assert (rate_of__function_guard o3 o2))

;; H
  (assert (dynamic_invariant2 o3 true false true true))

;; H
  (assert
  (= o3 (to_rep3
        (rec__ada___keccak__keccak_1600__duplex__context__rate
        ctx__split_fields))))

(assert
;; defqtvc
 ;; File "keccak-duplex.ads", line 115, characters 0-0
  (not (not (= 8 0))))
(check-sat)
