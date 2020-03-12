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

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-sort lane_type 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

(declare-fun attr__ATTRIBUTE_IMAGE3 ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) (_ BitVec 64))

(declare-fun user_eq2 (lane_type lane_type) Bool)

(declare-const dummy2 lane_type)

(declare-datatypes ()
((lane_type__ref (lane_type__refqtmk (lane_type__content lane_type)))))
(define-fun lane_type__ref_lane_type__content__projection ((a lane_type__ref)) lane_type 
  (lane_type__content a))

(declare-fun to_rep (lane_type) (_ BitVec 64))

(declare-fun of_rep ((_ BitVec 64)) lane_type)

;; inversion_axiom
  (assert
  (forall ((x lane_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 64)))
  (! (= (to_rep (of_rep x)) x) :pattern ((to_rep (of_rep x))) )))

(define-fun to_int3 ((x lane_type)) Int (bv2int (to_rep x)))

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
                                      (= (to_rep
                                         (get a temp___idx_154
                                         temp___idx_155)) (to_rep
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
  (= (to_rep (get a temp___idx_154 temp___idx_155)) (to_rep
                                                    (get b
                                                    (bvadd (bvsub b__first a__first) temp___idx_154)
                                                    (bvadd (bvsub b__first_2 a__first_2) temp___idx_155)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort index_number 0)

(declare-fun index_numberqtint (index_number) Int)

;; index_number'axiom
  (assert
  (forall ((i index_number))
  (and (<= 0 (index_numberqtint i)) (<= (index_numberqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (index_number index_number) Bool)

(declare-const dummy3 index_number)

(declare-datatypes ()
((index_number__ref
 (index_number__refqtmk (index_number__content index_number)))))
(define-fun index_number__ref_index_number__content__projection ((a index_number__ref)) index_number 
  (index_number__content a))

(declare-sort byte 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE5 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) (_ BitVec 8))

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
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int byte))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int byte) (elts a))

(define-fun of_array ((a (Array Int byte)) (f Int)
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

(define-fun bool_eq2 ((x us_t)
  (y us_t)) Bool (bool_eq1 (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq5 (us_t us_t) Bool)

(declare-const dummy5 us_t)

(declare-datatypes ()
((byte_array__ref (byte_array__refqtmk (byte_array__content us_t)))))
(define-fun byte_array__ref_byte_array__content__projection ((a byte_array__ref)) us_t 
  (byte_array__content a))

(declare-const data us_t)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const bit_len Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-const r47s Int)

(declare-const attr__ATTRIBUTE_ADDRESS12 Int)

(declare-const attr__ATTRIBUTE_ADDRESS13 Int)

(define-fun dynamic_invariant2 ((temp___expr_203 (_ BitVec 64))
  (temp___is_init_199 Bool) (temp___skip_constant_200 Bool)
  (temp___do_toplevel_201 Bool) (temp___do_typ_inv_202 Bool)) Bool true)

(declare-sort x_coord 0)

(define-fun in_range4 ((x (_ BitVec 8))) Bool (and (bvule #x00 x)
                                              (bvule x #x04)))

(define-fun in_range_int ((x Int)) Bool (and (<= 0 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE6 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) (_ BitVec 8))

(declare-fun user_eq6 (x_coord x_coord) Bool)

(declare-const dummy6 x_coord)

(declare-datatypes ()
((x_coord__ref (x_coord__refqtmk (x_coord__content x_coord)))))
(define-fun x_coord__ref_x_coord__content__projection ((a x_coord__ref)) x_coord 
  (x_coord__content a))

(define-fun dynamic_invariant3 ((temp___expr_210 (_ BitVec 8))
  (temp___is_init_206 Bool) (temp___skip_constant_207 Bool)
  (temp___do_toplevel_208 Bool)
  (temp___do_typ_inv_209 Bool)) Bool (=>
                                     (or (= temp___is_init_206 true)
                                     (bvule #x00 #x04)) (in_range4
                                     temp___expr_210)))

(declare-sort y_coord 0)

(define-fun in_range5 ((x (_ BitVec 8))) Bool (and (bvule #x00 x)
                                              (bvule x #x04)))

(define-fun in_range_int1 ((x Int)) Bool (and (<= 0 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE7 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) (_ BitVec 8))

(declare-fun user_eq7 (y_coord y_coord) Bool)

(declare-const dummy7 y_coord)

(declare-datatypes ()
((y_coord__ref (y_coord__refqtmk (y_coord__content y_coord)))))
(define-fun y_coord__ref_y_coord__content__projection ((a y_coord__ref)) y_coord 
  (y_coord__content a))

(define-fun dynamic_invariant4 ((temp___expr_217 (_ BitVec 8))
  (temp___is_init_213 Bool) (temp___skip_constant_214 Bool)
  (temp___do_toplevel_215 Bool)
  (temp___do_typ_inv_216 Bool)) Bool (=>
                                     (or (= temp___is_init_213 true)
                                     (bvule #x00 #x04)) (in_range5
                                     temp___expr_217)))

(define-fun dynamic_invariant5 ((temp___expr_280 us_t)
  (temp___is_init_276 Bool) (temp___skip_constant_277 Bool)
  (temp___do_toplevel_278 Bool)
  (temp___do_typ_inv_279 Bool)) Bool (=>
                                     (not (= temp___skip_constant_277 true))
                                     (dynamic_property 0 2147483647
                                     (first1 temp___expr_280)
                                     (last1 temp___expr_280))))

(define-fun dynamic_invariant6 ((temp___expr_273 (_ BitVec 8))
  (temp___is_init_269 Bool) (temp___skip_constant_270 Bool)
  (temp___do_toplevel_271 Bool) (temp___do_typ_inv_272 Bool)) Bool true)

(define-fun dynamic_invariant7 ((temp___expr_259 Int)
  (temp___is_init_255 Bool) (temp___skip_constant_256 Bool)
  (temp___do_toplevel_257 Bool)
  (temp___do_typ_inv_258 Bool)) Bool (=>
                                     (or (= temp___is_init_255 true)
                                     (<= 0 2147483647)) (in_range3
                                     temp___expr_259)))

(declare-const spark__branch Bool)

(declare-const a map1)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant5 data true false true true))

;; Assume
  (assert (dynamic_invariant bit_len true false true true))

;; Assume
  (assert
  (and (and (<= (length data) 268435455) (<= bit_len (* (length data) 8)))
  (<= bit_len 1600)))

(declare-const x (_ BitVec 8))

;; H
  (assert (= x #x00))

;; Assume
  (assert (dynamic_invariant3 x true false true true))

(declare-const y (_ BitVec 8))

;; H
  (assert (= y #x00))

;; Assume
  (assert (dynamic_invariant4 y true false true true))

(declare-const remaining_bits Int)

;; H
  (assert (= remaining_bits bit_len))

;; Assume
  (assert (dynamic_invariant remaining_bits true false true true))

(declare-const offset Int)

;; H
  (assert (= offset 0))

;; Assume
  (assert (dynamic_invariant offset true false true true))

(define-fun o () Int (+ bit_len 7))

;; Ensures
  (assert (in_range1 o))

(define-fun o1 () Int (div1 o 8))

;; Ensures
  (assert (in_range2 o1))

(declare-const initial_byte_len Int)

;; H
  (assert (= initial_byte_len o1))

;; Assume
  (assert (dynamic_invariant initial_byte_len true false true true))

(declare-const spark__branch1 Bool)

(declare-const a1 map1)

(declare-const x1 (_ BitVec 8))

(declare-const y1 (_ BitVec 8))

(declare-const remaining_bits1 Int)

(declare-const offset1 Int)

;; H
  (assert
  (ite (<= 64 remaining_bits)
  (let ((o2 (+ remaining_bits 7)))
  (and (in_range1 o2)
  (and (in_range1 (+ offset (div1 o2 8)))
  (exists ((a2 map1) (x2 (_ BitVec 8)) (y2 (_ BitVec 8))
  (remaining_bits2 Int) (offset2 Int))
  (and
  (and (= (mod2 offset2 8) 0)
  (= (+ offset2 (div1 (+ remaining_bits2 7) 8)) initial_byte_len))
  (and
  (= (and (ite (and
               (and
               (and (dynamic_invariant3 x2 true true true true)
               (dynamic_invariant4 y2 true true true true))
               (dynamic_invariant remaining_bits2 true true true true))
               (dynamic_invariant offset2 true true true true))
          true false) (ite (<= 64 remaining_bits2) true false)) true)
  (exists ((temp___764 Int))
  (and (= temp___764 offset2)
  (exists ((temp___763 Int))
  (and (= temp___763 remaining_bits2)
  (exists ((lane (_ BitVec 64)))
  (and (= lane #x0000000000000000)
  (and (dynamic_invariant2 lane true false true true)
  (exists ((i Int))
  (and (= i 0)
  (let ((o3 (* i 8)))
  (and (in_range1 o3)
  (and (in_range2 o3)
  (let ((o4 (+ (first1 data) offset2)))
  (and (in_range1 o4)
  (let ((o5 (+ o4 i)))
  (and (in_range1 o5)
  (and (and (<= (first1 data) o5) (<= o5 (last1 data)))
  (exists ((o6 (_ BitVec 8)))
  (and (= (to_rep2 (select (to_array data) o5)) o6)
  (exists ((lane1 (_ BitVec 64)))
  (and
  (= lane1 (bvor lane (bvshl ((_ zero_extend 56) o6) ((_ int2bv 64) o3))))
  (exists ((i1 Int))
  (and (= i1 1)
  (let ((o7 (* i1 8)))
  (and (in_range1 o7)
  (and (in_range2 o7)
  (let ((o8 (+ (first1 data) offset2)))
  (and (in_range1 o8)
  (let ((o9 (+ o8 i1)))
  (and (in_range1 o9)
  (and (and (<= (first1 data) o9) (<= o9 (last1 data)))
  (exists ((o10 (_ BitVec 8)))
  (and (= (to_rep2 (select (to_array data) o9)) o10)
  (exists ((lane2 (_ BitVec 64)))
  (and
  (= lane2 (bvor lane1 (bvshl ((_ zero_extend 56) o10) ((_ int2bv 64) o7))))
  (exists ((i2 Int))
  (and (= i2 2)
  (let ((o11 (* i2 8)))
  (and (in_range1 o11)
  (and (in_range2 o11)
  (let ((o12 (+ (first1 data) offset2)))
  (and (in_range1 o12)
  (let ((o13 (+ o12 i2)))
  (and (in_range1 o13)
  (and (and (<= (first1 data) o13) (<= o13 (last1 data)))
  (exists ((o14 (_ BitVec 8)))
  (and (= (to_rep2 (select (to_array data) o13)) o14)
  (exists ((lane3 (_ BitVec 64)))
  (and
  (= lane3 (bvor lane2 (bvshl ((_ zero_extend 56) o14) ((_ int2bv 64) o11))))
  (exists ((i3 Int))
  (and (= i3 3)
  (let ((o15 (* i3 8)))
  (and (in_range1 o15)
  (and (in_range2 o15)
  (let ((o16 (+ (first1 data) offset2)))
  (and (in_range1 o16)
  (let ((o17 (+ o16 i3)))
  (and (in_range1 o17)
  (and (and (<= (first1 data) o17) (<= o17 (last1 data)))
  (exists ((o18 (_ BitVec 8)))
  (and (= (to_rep2 (select (to_array data) o17)) o18)
  (exists ((lane4 (_ BitVec 64)))
  (and
  (= lane4 (bvor lane3 (bvshl ((_ zero_extend 56) o18) ((_ int2bv 64) o15))))
  (exists ((i4 Int))
  (and (= i4 4)
  (let ((o19 (* i4 8)))
  (and (in_range1 o19)
  (and (in_range2 o19)
  (let ((o20 (+ (first1 data) offset2)))
  (and (in_range1 o20)
  (let ((o21 (+ o20 i4)))
  (and (in_range1 o21)
  (and (and (<= (first1 data) o21) (<= o21 (last1 data)))
  (exists ((o22 (_ BitVec 8)))
  (and (= (to_rep2 (select (to_array data) o21)) o22)
  (exists ((lane5 (_ BitVec 64)))
  (and
  (= lane5 (bvor lane4 (bvshl ((_ zero_extend 56) o22) ((_ int2bv 64) o19))))
  (exists ((i5 Int))
  (and (= i5 5)
  (let ((o23 (* i5 8)))
  (and (in_range1 o23)
  (and (in_range2 o23)
  (let ((o24 (+ (first1 data) offset2)))
  (and (in_range1 o24)
  (let ((o25 (+ o24 i5)))
  (and (in_range1 o25)
  (and (and (<= (first1 data) o25) (<= o25 (last1 data)))
  (exists ((o26 (_ BitVec 8)))
  (and (= (to_rep2 (select (to_array data) o25)) o26)
  (exists ((lane6 (_ BitVec 64)))
  (and
  (= lane6 (bvor lane5 (bvshl ((_ zero_extend 56) o26) ((_ int2bv 64) o23))))
  (exists ((i6 Int))
  (and (= i6 6)
  (let ((o27 (* i6 8)))
  (and (in_range1 o27)
  (and (in_range2 o27)
  (let ((o28 (+ (first1 data) offset2)))
  (and (in_range1 o28)
  (let ((o29 (+ o28 i6)))
  (and (in_range1 o29)
  (and (and (<= (first1 data) o29) (<= o29 (last1 data)))
  (exists ((o30 (_ BitVec 8)))
  (and (= (to_rep2 (select (to_array data) o29)) o30)
  (exists ((lane7 (_ BitVec 64)))
  (and
  (= lane7 (bvor lane6 (bvshl ((_ zero_extend 56) o30) ((_ int2bv 64) o27))))
  (exists ((i7 Int))
  (and (= i7 7)
  (let ((o31 (* i7 8)))
  (and (in_range1 o31)
  (and (in_range2 o31)
  (let ((o32 (+ (first1 data) offset2)))
  (and (in_range1 o32)
  (let ((o33 (+ o32 i7)))
  (and (in_range1 o33)
  (and (and (<= (first1 data) o33) (<= o33 (last1 data)))
  (exists ((o34 (_ BitVec 8)))
  (and (= (to_rep2 (select (to_array data) o33)) o34)
  (exists ((lane8 (_ BitVec 64)))
  (and
  (= lane8 (bvor lane7 (bvshl ((_ zero_extend 56) o34) ((_ int2bv 64) o31))))
  (exists ((o35 (_ BitVec 64)))
  (and (= (to_rep (get a2 x2 y2)) o35)
  (exists ((o36 lane_type))
  (and (= (to_rep o36) (bvxor o35 lane8))
  (and (= a1 (set a2 x2 y2 o36))
  (exists ((o37 (_ BitVec 8)))
  (and
  (let ((temp___753 (bvadd x2 #x01)))
  (ite (bvule (bvsub #x05 x2) #x01) (= o37 (bvsub temp___753 #x05))
  (= o37 temp___753)))
  (and (= x1 o37)
  (and
  (and (= spark__branch1 (ite (= x1 #x00) true false))
  (ite (= spark__branch1 true)
  (exists ((o38 (_ BitVec 8)))
  (and
  (let ((temp___754 (bvadd y2 #x01)))
  (ite (bvule (bvsub #x05 y2) #x01) (= o38 (bvsub temp___754 #x05))
  (= o38 temp___754))) (= y1 o38))) (= y1 y2)))
  (let ((o38 (+ offset2 8)))
  (and (in_range1 o38)
  (and (= offset1 o38)
  (let ((o39 (- remaining_bits2 64)))
  (and (in_range2 o39)
  (and (= remaining_bits1 o39) (not (<= 64 remaining_bits1))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  (and
  (and
  (and (and (and (= spark__branch1 spark__branch) (= a1 a)) (= x1 x))
  (= y1 y)) (= remaining_bits1 remaining_bits)) (= offset1 offset))))

(declare-const spark__branch2 Bool)

;; H
  (assert (= spark__branch2 (ite (< 0 remaining_bits1) true false)))

;; H
  (assert (= spark__branch2 true))

(declare-const word (_ BitVec 64))

;; H
  (assert (= word #x0000000000000000))

;; Assume
  (assert (dynamic_invariant2 word true false true true))

(define-fun o2 () Int (+ remaining_bits1 7))

;; Ensures
  (assert (in_range1 o2))

(assert
;; defqtvc
 ;; File "keccak-keccakf-byte_lanes.ads", line 32, characters 0-0
  (not (not (= 8 0))))
(check-sat)
