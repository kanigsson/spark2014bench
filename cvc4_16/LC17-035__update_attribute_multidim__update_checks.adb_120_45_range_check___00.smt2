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

(declare-sort et1 0)

(declare-fun et1qtint (et1) Int)

;; et1'axiom
  (assert (forall ((i et1)) (and (<= 0 (et1qtint i)) (<= (et1qtint i) 99))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 99)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (et1 et1) Bool)

(declare-const dummy et1)

(declare-datatypes ((et1__ref 0))
(((et1__refqtmk (et1__content et1)))))
(define-fun et1__ref_et1__content__projection ((a et1__ref)) et1 (et1__content
                                                                 a))

(define-fun to_rep ((x et1)) Int (et1qtint x))

(declare-fun of_rep (Int) et1)

;; inversion_axiom
  (assert
  (forall ((x et1)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x et1)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort map1 0)

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content map1)))))
(declare-fun get (map1 Int Int Int) et1)

(declare-fun set (map1 Int Int Int et1) map1)

;; Select_eq
  (assert
  (forall ((m map1))
  (forall ((i Int))
  (forall ((j Int))
  (forall ((k Int))
  (forall ((a et1))
  (! (= (get (set m i j k a) i j k) a) :pattern ((set m i j k a)) )))))))

;; Select_neq
  (assert
  (forall ((m map1))
  (forall ((i Int) (i2 Int))
  (forall ((j Int) (j2 Int))
  (forall ((k Int) (k2 Int))
  (forall ((a et1))
  (! (=> (not (and (= i i2) (and (= j j2) (= k k2))))
     (= (get (set m i j k a) i2 j2 k2) (get m i2 j2 k2))) :pattern ((get
                                                                    (set m i
                                                                    j k a) i2
                                                                    j2 k2)) :pattern (
  (set m i j k a) (get m i2 j2 k2)) )))))))

(declare-fun slide (map1 Int Int Int Int Int Int) map1)

;; slide_def
  (assert
  (forall ((a map1))
  (forall ((old_first Int) (new_first Int))
  (forall ((old_first_2 Int) (new_first_2 Int))
  (forall ((old_first_3 Int) (new_first_3 Int))
  (forall ((i Int))
  (forall ((j Int))
  (forall ((k Int))
  (! (= (get
        (slide a old_first new_first old_first_2 new_first_2 old_first_3
        new_first_3) i j k) (get a (- i (- new_first old_first))
                            (- j (- new_first_2 old_first_2))
                            (- k (- new_first_3 old_first_3)))) :pattern (
  (get
  (slide a old_first new_first old_first_2 new_first_2 old_first_3
  new_first_3) i j k)) )))))))))

(define-fun bool_eq ((a map1) (a__first Int) (a__last Int) (a__first_2 Int)
  (a__last_2 Int) (a__first_3 Int) (a__last_3 Int) (b map1) (b__first Int)
  (b__last Int) (b__first_2 Int) (b__last_2 Int) (b__first_3 Int)
  (b__last_3 Int)) Bool (ite (and
                             (and
                             (and
                             (ite (<= a__first a__last)
                             (and (<= b__first b__last)
                             (= (- a__last a__first) (- b__last b__first)))
                             (< b__last b__first))
                             (ite (<= a__first_2 a__last_2)
                             (and (<= b__first_2 b__last_2)
                             (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
                             (< b__last_2 b__first_2)))
                             (ite (<= a__first_3 a__last_3)
                             (and (<= b__first_3 b__last_3)
                             (= (- a__last_3 a__first_3) (- b__last_3 b__first_3)))
                             (< b__last_3 b__first_3)))
                             (forall ((temp___idx_154 Int)
                             (temp___idx_155 Int) (temp___idx_156 Int))
                             (=>
                             (and
                             (and
                             (and (<= a__first temp___idx_154)
                             (<= temp___idx_154 a__last))
                             (and (<= a__first_2 temp___idx_155)
                             (<= temp___idx_155 a__last_2)))
                             (and (<= a__first_3 temp___idx_156)
                             (<= temp___idx_156 a__last_3)))
                             (= (to_rep
                                (get a temp___idx_154 temp___idx_155
                                temp___idx_156)) (to_rep
                                                 (get b
                                                 (+ (- b__first a__first) temp___idx_154)
                                                 (+ (- b__first_2 a__first_2) temp___idx_155)
                                                 (+ (- b__first_3 a__first_3) temp___idx_156)))))))
                        true false))

;; bool_eq_rev
  (assert
  (forall ((a map1) (b map1))
  (forall ((a__first Int) (a__last Int) (a__first_2 Int) (a__last_2 Int)
  (a__first_3 Int) (a__last_3 Int) (b__first Int) (b__last Int)
  (b__first_2 Int) (b__last_2 Int) (b__first_3 Int) (b__last_3 Int))
  (=>
  (= (bool_eq b b__first b__last b__first_2 b__last_2 b__first_3 b__last_3 a
     a__first a__last a__first_2 a__last_2 a__first_3 a__last_3) true)
  (and
  (and
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (ite (<= a__first_2 a__last_2)
  (and (<= b__first_2 b__last_2)
  (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
  (< b__last_2 b__first_2)))
  (ite (<= a__first_3 a__last_3)
  (and (<= b__first_3 b__last_3)
  (= (- a__last_3 a__first_3) (- b__last_3 b__first_3)))
  (< b__last_3 b__first_3)))
  (forall ((temp___idx_154 Int) (temp___idx_155 Int) (temp___idx_156 Int))
  (=>
  (and
  (and (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (and (<= a__first_2 temp___idx_155) (<= temp___idx_155 a__last_2)))
  (and (<= a__first_3 temp___idx_156) (<= temp___idx_156 a__last_3)))
  (= (to_rep (get a temp___idx_154 temp___idx_155 temp___idx_156)) (to_rep
                                                                   (get b
                                                                   (+ (- b__first a__first) temp___idx_154)
                                                                   (+ (- b__first_2 a__first_2) temp___idx_155)
                                                                   (+ (- b__first_3 a__first_3) temp___idx_156)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const x2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const x3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const y1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const y2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const y3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const z1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const z2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const z3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const new_val_1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const new_val_2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-sort it1 0)

(declare-fun it1qtint (it1) Int)

;; it1'axiom
  (assert (forall ((i it1)) (and (<= 1 (it1qtint i)) (<= (it1qtint i) 3))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (it1 it1) Bool)

(declare-const dummy1 it1)

(declare-datatypes ((it1__ref 0))
(((it1__refqtmk (it1__content it1)))))
(define-fun it1__ref_it1__content__projection ((a it1__ref)) it1 (it1__content
                                                                 a))

(define-fun dynamic_invariant ((temp___expr_168 Int)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (or (= temp___is_init_164 true)
                                     (<= 1 3)) (in_range1 temp___expr_168)))

(declare-sort it2 0)

(declare-fun it2qtint (it2) Int)

;; it2'axiom
  (assert (forall ((i it2)) (and (<= 1 (it2qtint i)) (<= (it2qtint i) 5))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (it2 it2) Bool)

(declare-const dummy2 it2)

(declare-datatypes ((it2__ref 0))
(((it2__refqtmk (it2__content it2)))))
(define-fun it2__ref_it2__content__projection ((a it2__ref)) it2 (it2__content
                                                                 a))

(define-fun dynamic_invariant1 ((temp___expr_175 Int)
  (temp___is_init_171 Bool) (temp___skip_constant_172 Bool)
  (temp___do_toplevel_173 Bool)
  (temp___do_typ_inv_174 Bool)) Bool (=>
                                     (or (= temp___is_init_171 true)
                                     (<= 1 5)) (in_range2 temp___expr_175)))

(declare-sort it3 0)

(declare-fun it3qtint (it3) Int)

;; it3'axiom
  (assert (forall ((i it3)) (and (<= 1 (it3qtint i)) (<= (it3qtint i) 10))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (it3 it3) Bool)

(declare-const dummy3 it3)

(declare-datatypes ((it3__ref 0))
(((it3__refqtmk (it3__content it3)))))
(define-fun it3__ref_it3__content__projection ((a it3__ref)) it3 (it3__content
                                                                 a))

(define-fun dynamic_invariant2 ((temp___expr_182 Int)
  (temp___is_init_178 Bool) (temp___skip_constant_179 Bool)
  (temp___do_toplevel_180 Bool)
  (temp___do_typ_inv_181 Bool)) Bool (=>
                                     (or (= temp___is_init_178 true)
                                     (<= 1 10)) (in_range3 temp___expr_182)))

(define-fun dynamic_invariant3 ((temp___expr_189 Int)
  (temp___is_init_185 Bool) (temp___skip_constant_186 Bool)
  (temp___do_toplevel_187 Bool)
  (temp___do_typ_inv_188 Bool)) Bool (=>
                                     (or (= temp___is_init_185 true)
                                     (<= 0 99)) (in_range temp___expr_189)))

(declare-fun temp_____aggregate_def_334 (map1 Int Int Int Int Int Int Int Int
  Int Int Int) map1)

;; def_axiom
  (assert
  (forall ((temp___336 map1))
  (forall ((temp___337 Int) (temp___338 Int) (temp___339 Int)
  (temp___340 Int) (temp___341 Int) (temp___342 Int) (temp___343 Int)
  (temp___344 Int) (temp___345 Int) (temp___346 Int) (temp___347 Int))
  (let ((temp___335 (temp_____aggregate_def_334 temp___336 temp___337
                    temp___338 temp___339 temp___340 temp___341 temp___342
                    temp___343 temp___344 temp___345 temp___346 temp___347)))
  (=>
  (and (dynamic_invariant temp___337 true true true true)
  (and
  (and
  (and
  (and (dynamic_invariant1 temp___338 true true true true)
  (dynamic_invariant2 temp___339 true true true true)) (dynamic_invariant
  temp___340 true true true true))
  (and (dynamic_invariant1 temp___341 true true true true)
  (dynamic_invariant2 temp___342 true true true true)))
  (and
  (and
  (and (dynamic_invariant3 temp___343 true true true true) (dynamic_invariant
  temp___344 true true true true)) (dynamic_invariant1 temp___345 true true
  true true))
  (and (dynamic_invariant2 temp___346 true true true true)
  (dynamic_invariant3 temp___347 true true true true)))))
  (forall ((temp___348 Int) (temp___349 Int) (temp___350 Int))
  (ite (and (and (= temp___348 temp___344) (= temp___349 temp___345))
       (= temp___350 temp___346))
  (= (to_rep (get temp___335 temp___348 temp___349 temp___350)) temp___347)
  (ite (or
       (and (and (= temp___348 temp___337) (= temp___349 temp___338))
       (= temp___350 temp___339))
       (and (and (= temp___348 temp___340) (= temp___349 temp___341))
       (= temp___350 temp___342)))
  (= (to_rep (get temp___335 temp___348 temp___349 temp___350)) temp___343)
  (= (get temp___335 temp___348 temp___349 temp___350) (get temp___336
                                                       temp___348 temp___349
                                                       temp___350))))))))))

(assert
;; defqtvc
 ;; File "update_checks.adb", line 106, characters 0-0
  (not
  (forall ((spark__branch Bool))
  (=> (dynamic_invariant x1 true false true true)
  (=> (dynamic_invariant x2 true false true true)
  (=> (dynamic_invariant x3 true false true true)
  (=> (dynamic_invariant1 y1 true false true true)
  (=> (dynamic_invariant1 y2 true false true true)
  (=> (dynamic_invariant1 y3 true false true true)
  (=> (dynamic_invariant2 z1 true false true true)
  (=> (dynamic_invariant2 z2 true false true true)
  (=> (dynamic_invariant2 z3 true false true true)
  (=> (dynamic_invariant3 new_val_1 true false true true)
  (=> (dynamic_invariant3 new_val_2 true false true true)
  (=>
  (= spark__branch (ite (and
                        (and
                        (and
                        (and
                        (and
                        (and
                        (and (and (and (< 1 x1) (< 1 y1)) (< 1 z1)) (< x2 3))
                        (< y2 5)) (< z2 10)) (< x3 3)) (< y3 5)) (< z3 10))
                        (< new_val_1 99))
                   (ite (< 0 new_val_2) true false) false))
  (=> (= spark__branch true)
  (=> (in_range (- new_val_2 1)) (in_range3 (+ z3 1)))))))))))))))))))
(check-sat)
(exit)
