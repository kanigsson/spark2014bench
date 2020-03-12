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

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const dummy1 (Array Int integer))

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

(declare-fun user_eq1 ((Array Int integer) (Array Int integer)) Bool)

(declare-sort map1 0)

(declare-datatypes () ((map__ref1 (map__refqtmk1 (map__content1 map1)))))
(declare-fun get (map1 Int Int) (Array Int integer))

(declare-fun set (map1 Int Int (Array Int integer)) map1)

;; Select_eq
  (assert
  (forall ((m map1))
  (forall ((i Int))
  (forall ((j Int))
  (forall ((a (Array Int integer)))
  (! (= (get (set m i j a) i j) a) :pattern ((set m i j a)) ))))))

;; Select_neq
  (assert
  (forall ((m map1))
  (forall ((i Int) (i2 Int))
  (forall ((j Int) (j2 Int))
  (forall ((a (Array Int integer)))
  (! (=> (not (and (= i i2) (= j j2)))
     (= (get (set m i j a) i2 j2) (get m i2 j2))) :pattern ((get
                                                            (set m i j a) i2
                                                            j2)) :pattern (
  (set m i j a) (get m i2 j2)) ))))))

(declare-fun slide1 (map1 Int Int Int Int) map1)

;; slide_def
  (assert
  (forall ((a map1))
  (forall ((new_first Int) (old_first Int))
  (forall ((new_first_2 Int) (old_first_2 Int))
  (forall ((i Int))
  (forall ((j Int))
  (! (= (get (slide1 a old_first new_first old_first_2 new_first_2) i j) 
  (get a (- i (- new_first old_first)) (- j (- new_first_2 old_first_2)))) :pattern (
  (get (slide1 a old_first new_first old_first_2 new_first_2) i j)) )))))))

(define-fun bool_eq1 ((a map1) (a__first Int) (a__last Int) (a__first_2 Int)
  (a__last_2 Int) (b map1) (b__first Int) (b__last Int) (b__first_2 Int)
  (b__last_2 Int)) Bool (ite (and
                             (and
                             (ite (<= a__first a__last)
                             (and (<= b__first b__last)
                             (= (- a__last a__first) (- b__last b__first)))
                             (< b__last b__first))
                             (ite (<= a__first_2 a__last_2)
                             (and (<= b__first_2 b__last_2)
                             (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
                             (< b__last_2 b__first_2)))
                             (forall ((temp___idx_155 Int)
                             (temp___idx_156 Int))
                             (=>
                             (and
                             (and (<= a__first temp___idx_155)
                             (<= temp___idx_155 a__last))
                             (and (<= a__first_2 temp___idx_156)
                             (<= temp___idx_156 a__last_2)))
                             (= (bool_eq
                                (get a temp___idx_155 temp___idx_156) 1 3
                                (get b
                                (+ (- b__first a__first) temp___idx_155)
                                (+ (- b__first_2 a__first_2) temp___idx_156))
                                1 3) true))))
                        true false))

;; bool_eq_rev
  (assert
  (forall ((a map1) (b map1))
  (forall ((a__first Int) (a__last Int) (a__first_2 Int) (a__last_2 Int)
  (b__first Int) (b__last Int) (b__first_2 Int) (b__last_2 Int))
  (=>
  (= (bool_eq1 b b__first b__last b__first_2 b__last_2 a a__first a__last
     a__first_2 a__last_2) true)
  (and
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (ite (<= a__first_2 a__last_2)
  (and (<= b__first_2 b__last_2)
  (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
  (< b__last_2 b__first_2)))
  (forall ((temp___idx_155 Int) (temp___idx_156 Int))
  (=>
  (and (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (and (<= a__first_2 temp___idx_156) (<= temp___idx_156 a__last_2)))
  (= (bool_eq (get a temp___idx_155 temp___idx_156) 1 3
     (get b (+ (- b__first a__first) temp___idx_155)
     (+ (- b__first_2 a__first_2) temp___idx_156)) 1 3) true))))))))

(declare-const dummy2 map1)

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

(declare-fun user_eq2 (map1 map1) Bool)

(declare-datatypes ()
((map__ref2 (map__refqtmk2 (map__content2 (Array Int map1))))))
(declare-fun slide2 ((Array Int map1) Int Int) (Array Int map1))

;; slide_eq
  (assert
  (forall ((a (Array Int map1)))
  (forall ((first Int))
  (! (= (slide2 a first first) a) :pattern ((slide2 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int map1)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide2 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide2 a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int map1)) (a__first Int) (a__last Int)
  (b (Array Int map1)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_157 Int))
                           (=>
                           (and (<= a__first temp___idx_157)
                           (<= temp___idx_157 a__last))
                           (= (bool_eq1 (select a temp___idx_157) 1 3 1 3
                              (select b (+ (- b__first a__first) temp___idx_157))
                              1 3 1 3) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int map1)) (b (Array Int map1)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_157 Int))
  (=> (and (<= a__first temp___idx_157) (<= temp___idx_157 a__last))
  (= (bool_eq1 (select a temp___idx_157) 1 3 1 3
     (select b (+ (- b__first a__first) temp___idx_157)) 1 3 1 3) true))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y (Array Int map1))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 3))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (index index) Bool)

(declare-const dummy3 index)

(declare-datatypes () ((index__ref (index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

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

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; component__size_axiom
  (assert (<= 0 component__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(define-fun bool_eq3 ((x us_t)
  (y1 us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                  (to_rep (last (rt x))) (elts y1) (to_rep (first (rt y1)))
                  (to_rep (last (rt y1)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes () ((tt1B__ref (tt1B__refqtmk (tt1B__content us_t)))))
(define-fun tt1B__ref_tt1B__content__projection ((a tt1B__ref)) us_t 
  (tt1B__content a))

(declare-datatypes () ((t13b__ref (t13b__refqtmk (t13b__content us_t)))))
(define-fun t13b__ref_t13b__content__projection ((a t13b__ref)) us_t 
  (t13b__content a))

(declare-datatypes () ((t15b__ref (t15b__refqtmk (t15b__content us_t)))))
(define-fun t15b__ref_t15b__content__projection ((a t15b__ref)) us_t 
  (t15b__content a))

(declare-fun p_slice__x__aggregate_def (map1) (Array Int map1))

(declare-fun temp_____aggregate_def_232 ((Array Int integer)) map1)

(declare-fun temp_____aggregate_def_237 (Int) (Array Int integer))

(declare-fun temp_____aggregate_def_249 (Int Int Int) us_t)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant1 ((temp___expr_183 Int)
  (temp___is_init_179 Bool) (temp___skip_constant_180 Bool)
  (temp___do_toplevel_181 Bool)
  (temp___do_typ_inv_182 Bool)) Bool (=>
                                     (or (= temp___is_init_179 true)
                                     (<= 1 3)) (in_range2 temp___expr_183)))

;; def_axiom
  (assert
  (forall ((temp___230 map1))
  (forall ((temp___231 Int))
  (= (select (p_slice__x__aggregate_def temp___230) temp___231) temp___230))))

;; def_axiom
  (assert
  (forall ((temp___234 (Array Int integer)))
  (forall ((temp___235 Int) (temp___236 Int))
  (= (get (temp_____aggregate_def_232 temp___234) temp___235 temp___236) temp___234))))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___239 Int))
  (=> (dynamic_invariant temp___239 true true true true)
  (forall ((temp___240 Int))
  (= (select (temp_____aggregate_def_237 temp___239) temp___240) rliteral)))))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) 1))

;; def_axiom
  (assert
  (forall ((temp___251 Int) (temp___252 Int) (temp___253 Int))
  (let ((temp___250 (temp_____aggregate_def_249 temp___251 temp___252
                    temp___253)))
  (=> (dynamic_invariant temp___251 true true true true)
  (and
  (=> (dynamic_property 1 3 temp___252 temp___253)
  (and (= (first1 temp___250) temp___252) (= (last1 temp___250) temp___253)))
  (forall ((temp___254 Int))
  (= (select (to_array temp___250) temp___254) rliteral1)))))))

(declare-const x (Array Int map1))

;; H
  (assert
  (= x (p_slice__x__aggregate_def
       (temp_____aggregate_def_232 (temp_____aggregate_def_237 0)))))

;; Assume
  (assert true)

;; Assume
  (assert (= x y))

;; Assume
  (assert true)

(declare-const i3 Int)

;; H
  (assert (= i3 1))

;; H
  (assert
  (= (and (ite (<= 1 i3) true false) (ite (<= i3 3) true false)) true))

(declare-const x1 (Array Int map1))

(declare-const i31 Int)

;; H
  (assert
  (= (and (ite (forall ((temp___303 Int))
               (=> (and (<= 1 temp___303) (<= temp___303 3))
               (ite (or (< 3 temp___303)
                    (or (< temp___303 1) (<= i31 temp___303)))
               (= (select x1 temp___303) (select x temp___303))
               (forall ((temp___304 Int) (temp___305 Int))
               (=>
               (and (and (<= 1 temp___304) (<= temp___304 3))
               (and (<= 1 temp___305) (<= temp___305 3)))
               (forall ((temp___306 Int))
               (=> (and (<= 1 temp___306) (<= temp___306 3))
               (=> (< 2 temp___306)
               (= (select (get (select x1 temp___303) temp___304 temp___305) temp___306) (select 
               (get (select x temp___303) temp___304 temp___305) temp___306))))))))))
          true false) (ite (and (<= 1 i31) (<= i31 3)) true false)) true))

(declare-const i21 Int)

;; H
  (assert (= i21 1))

;; H
  (assert
  (= (and (ite (<= 1 i21) true false) (ite (<= i21 3) true false)) true))

(declare-const x2 (Array Int map1))

(declare-const i211 Int)

;; H
  (assert
  (= (and (ite (forall ((temp___278 Int))
               (=> (and (<= 1 temp___278) (<= temp___278 3))
               (ite (not (= i31 temp___278))
               (= (select x2 temp___278) (select x1 temp___278))
               (forall ((temp___279 Int) (temp___280 Int))
               (=>
               (and (and (<= 1 temp___279) (<= temp___279 3))
               (and (<= 1 temp___280) (<= temp___280 3)))
               (ite (or (< 3 temp___279)
                    (or (< temp___279 1) (<= i211 temp___279)))
               (= (get (select x2 temp___278) temp___279 temp___280) 
               (get (select x1 temp___278) temp___279 temp___280))
               (forall ((temp___281 Int))
               (=> (and (<= 1 temp___281) (<= temp___281 3))
               (=> (< 2 temp___281)
               (= (select (get (select x2 temp___278) temp___279 temp___280) temp___281) (select 
               (get (select x1 temp___278) temp___279 temp___280) temp___281)))))))))))
          true false) (ite (and (<= 1 i211) (<= i211 3)) true false)) true))

(declare-const i22 Int)

;; H
  (assert (= i22 1))

;; H
  (assert
  (= (and (ite (<= 1 i22) true false) (ite (<= i22 3) true false)) true))

(declare-const x3 (Array Int map1))

(declare-const i221 Int)

;; H
  (assert
  (= (and (ite (forall ((temp___273 Int))
               (=> (and (<= 1 temp___273) (<= temp___273 3))
               (ite (not (= i31 temp___273))
               (= (select x3 temp___273) (select x2 temp___273))
               (forall ((temp___274 Int) (temp___275 Int))
               (=>
               (and (and (<= 1 temp___274) (<= temp___274 3))
               (and (<= 1 temp___275) (<= temp___275 3)))
               (ite (or (< 3 temp___275)
                    (or (< temp___275 1)
                    (or (<= i221 temp___275) (not (= i211 temp___274)))))
               (= (get (select x3 temp___273) temp___274 temp___275) 
               (get (select x2 temp___273) temp___274 temp___275))
               (forall ((temp___276 Int))
               (=> (and (<= 1 temp___276) (<= temp___276 3))
               (=> (< 2 temp___276)
               (= (select (get (select x3 temp___273) temp___274 temp___275) temp___276) (select 
               (get (select x2 temp___273) temp___274 temp___275) temp___276)))))))))))
          true false) (ite (and (<= 1 i221) (<= i221 3)) true false)) true))

(declare-const i1 Int)

;; H
  (assert (= i1 1))

;; H
  (assert
  (= (and (ite (<= 1 i1) true false) (ite (<= i1 3) true false)) true))

(declare-const x4 (Array Int map1))

(declare-const i11 Int)

;; H
  (assert
  (= (and (ite (forall ((temp___268 Int))
               (=> (and (<= 1 temp___268) (<= temp___268 3))
               (ite (not (= i31 temp___268))
               (= (select x4 temp___268) (select x3 temp___268))
               (forall ((temp___269 Int) (temp___270 Int))
               (=>
               (and (and (<= 1 temp___269) (<= temp___269 3))
               (and (<= 1 temp___270) (<= temp___270 3)))
               (ite (or (not (= i221 temp___270)) (not (= i211 temp___269)))
               (= (get (select x4 temp___268) temp___269 temp___270) 
               (get (select x3 temp___268) temp___269 temp___270))
               (forall ((temp___271 Int))
               (=> (and (<= 1 temp___271) (<= temp___271 3))
               (=> (or (< 2 temp___271) (< temp___271 1))
               (= (select (get (select x4 temp___268) temp___269 temp___270) temp___271) (select 
               (get (select x3 temp___268) temp___269 temp___270) temp___271)))))))))))
          true false) (ite (and (<= 1 i11) (<= i11 3)) true false)) true))

(define-fun temp___255 () us_t (temp_____aggregate_def_249 1 i11 2))

;; Assume
  (assert (= (first1 temp___255) i11))

;; Assume
  (assert (= (last1 temp___255) 2))

;; Assert
  (assert
  (ite (<= (first1 temp___255) (last1 temp___255))
  (and (<= i11 2) (= (- (last1 temp___255) (first1 temp___255)) (- 2 i11)))
  (< 2 i11)))

(define-fun temp___257 () us_t (of_array
                               (slide (to_array temp___255)
                               (first1 temp___255) i11) i11 2))

;; H
  (assert (<= i11 2))

(assert
;; defqtvc
 ;; File "p_slice.adb", line 1, characters 0-0
  (not (<= 1 i11)))
(check-sat)
